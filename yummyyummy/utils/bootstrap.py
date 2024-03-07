from django import forms

class BootStrap():
    def __init__(self,*args, **kwargs):
        super().__init__(*args, **kwargs)
        for name,field in self.fields.items():
            if field.widget.attrs:
                if field.widget.attrs.get('class'):
                    field.widget.attrs["class"]+=" form-control form-control-lg"
                else:
                    field.widget.attrs["class"]=" form-control form-control-lg"
            else:
                field.widget.attrs={'class':'form-control form-control-lg'}

class BootStrapForm(BootStrap,forms.Form):
    pass

class BootStrapModelForm(BootStrap,forms.ModelForm):
    pass

