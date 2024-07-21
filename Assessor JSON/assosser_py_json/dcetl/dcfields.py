'''Module docs here'''
from flask_restful import fields
from flask_restful.fields import MarshallingException


class Joiner(fields.Raw):
    '''Class docs here'''

    def __init__(self, separator, *attrs, exclude_truthless: bool = True):
        '''Init docs here'''
        super(Joiner, self).__init__()
        self.separator = separator
        self.attrs = attrs
        self.exclude_truthless = exclude_truthless

    def output(self, key, obj):
        data = fields.to_marshallable_type(obj)
        if self.exclude_truthless:
            return self.separator.join(data[a] for a in self.attrs if data[a])
        else:
            return self.separator.join(data[a] for a in self.attrs)


class Splitter(fields.Raw):
    """Class docs here"""

    def __init__(self, attribute, separator=','):
        super(Splitter, self).__init__(attribute=attribute)
        self.separator = separator

    def output(self, key, obj):
        data = fields.to_marshallable_type(obj)
        return [str(i) for i in data[self.attribute].split(self.separator)] \
            if data[self.attribute] else []


class IntSplitter(fields.Raw):
    """Class docs here"""

    def __init__(self, attribute, separator):
        super(IntSplitter, self).__init__(attribute=attribute)
        self.separator = separator

    def output(self, key, obj):
        data = fields.to_marshallable_type(obj)
        return [int(i) for i in data[self.attribute].split(self.separator)] \
            if data[self.attribute] else []


class BooleanCheck(fields.Raw):
    """Class docs here"""

    def __init__(self, attribute, check=lambda x: bool(x)):
        super(BooleanCheck, self).__init__(attribute=attribute)
        self.check = check

    def output(self, key, obj):
        data = fields.to_marshallable_type(obj)
        return self.check(data[self.attribute])


class ZipCode(fields.Raw):
    def __init__(self, attribute):
        super(ZipCode, self).__init__(attribute=attribute)

    def output(self, key, obj):
        zip_code: str = fields.to_marshallable_type(obj)[self.attribute]
        if zip_code is None or zip_code == '00000' or zip_code == '000000000':
            return None
        if zip_code.endswith('0000'):
            return zip_code[:-4]
        if len(zip_code) == 9:
            return "-".join((zip_code[:5], zip_code[5:]))
        return zip_code


class IsoDateOnly(fields.Raw):
    """
    Return a formatted datetime string in UTC. Supported formats are RFC 822
    and ISO 8601.

    See :func:`email.utils.formatdate` for more info on the RFC 822 format.

    See :meth:`datetime.datetime.isoformat` for more info on the ISO 8601
    format.

    :param dt_format: ``'rfc822'`` or ``'iso8601'``
    :type dt_format: str
    """
    def __init__(self, **kwargs):
        super(IsoDateOnly, self).__init__(**kwargs)

    def format(self, value):
        try:
            return value.date().isoformat()
        except AttributeError as ae:
            raise MarshallingException(ae)


class GeoLocation(fields.Raw):
    """Class docs here"""

    def __init__(self, separator, *attrs, exclude_truthless: bool = True):
        '''Init docs here'''
        super(GeoLocation, self).__init__()
        self.separator = separator
        self.attrs = attrs
        self.exclude_truthless = exclude_truthless

    def output(self, key, obj):
        data = fields.to_marshallable_type(obj)
        if self.exclude_truthless:
            return self.separator.join(str(data[a]) for a in self.attrs if data[a])
        else:
            return self.separator.join(str(data[a]) for a in self.attrs)

#class GeoSpatial(fields.Raw):
#    '''Class docs here'''

#    def __init__(self, *attrs):
#        '''Init docs here'''
#        super(GeoSpatial, self).__init__()
#        self.attrs = attrs

#    def output(self, key, obj):
#        data = fields.to_marshallable_type(obj)
#        #print(self.attrs)
#        mylist = []
#        for a in self.attrs:
#            if (data[a]):
#                mylist.append(data[a])
#            else:
#                mylist.append(0)
#        return mylist

