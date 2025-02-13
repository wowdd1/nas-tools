import json

from app.utils import RequestUtils


class CookieCloudHelper(object):
    _req = None
    _server = None
    _key = None
    _password = None

    def __init__(self, server, key, password):
        self._server = server
        self._key = key
        self._password = password
        self._req = RequestUtils(content_type="application/json")

    def download_data(self):
        """
        从CookieCloud下载数据
        """
        if not self._server or not self._key or not self._password:
            return {}, "CookieCloud参数不正确"
        req_url = "%s/get/%s" % (self._server, self._key)
        ret = self._req.post_res(url=req_url, params=json.dumps({"password": self._password}))
        if ret and ret.status_code == 200:
            return ret.json(), ""
        elif ret:
            return {}, "同步CookieCloud失败，错误码：%s" % ret.status_code
        else:
            return {}, "CookieCloud请求失败，请检查服务器地址、用户KEY及加密密码是否正确"
