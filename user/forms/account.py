from django import forms
from user.models import UserInfo
from django.core.exceptions import ValidationError


class RegisterModelForm(forms.ModelForm):
    pwd = forms.CharField(
        label='密码',
        min_length=6,
        max_length=30,
        error_messages={
            'min_length': "密码长度不能小于6个字符",
            'max_length': "密码长度不能大于30个字符"
        },

        widget=forms.PasswordInput(attrs={'placeholder': '请输入密码'})
    )

    class Meta:
        model = UserInfo
        fields = ['username', 'pwd']

    def clean_username(self):
        username = self.cleaned_data['username']
        # 通过 self.cleaned_data 字典获取用户输入的用户名信息。
        exists = UserInfo.objects.filter(username=username).exists()
        if exists:
            raise ValidationError('用户名已存在')
        return username


class LoginForm(forms.Form):
    username = forms.CharField(label='用户名')
    password = forms.CharField(label='密码', widget=forms.PasswordInput(render_value=True))

    class Meta:
        fields = ['username', 'password']

    def __init__(self, request, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.request = request

    def clean_password(self):
        pwd = self.cleaned_data['password']
        return encrypt.md5(pwd)
