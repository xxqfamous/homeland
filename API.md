# API 文档



## OAuth 2 / API 认证

在使用 API 之前，你需要 [注册应用](/oauth/applications/new) 并获得可以 **OAuth App** 信息。并使用标准的 OAuth 2 实现登录，获得 `access_token` 信息。

### OAuth 路径

- /oauth/authorize
- /oauth/token
- /oauth/revoke

### Response 说明

所有 Response 采用 JSON 格式返回，请求状态通过 HTTP Status 返回。

### HTTP Status

错误的情况 Response Body 一定会是这样的格式: `{ "error" : "Error message" }`

- 200, 201 - 请求成功，或执行成功。
- 400 - 参数不符合 API 的要求、或者数据格式验证没有通过，请配合 Response Body 里面的 error 信息确定问题。
- 401 - 用户认证失败，或缺少认证信息，比如 access_token 过期，或没传，可以尝试用 refresh_token 方式获得新的 access_token。
- 403 - 当前用户对资源没有操作权限。
- 404 - 资源不存在。
- 500 - 服务器异常。

#### 资源权限描述

在部分 API 的 response 内容里面你会看到 `abilities` 节点，这是特别标识当前 `access_token` 对应的用户对此资源的权限。

请参考源代码，确定那些路径是需要用户认证的，需要用户认证的路径，你需要带上 `access_token=?` 参数。

**例如**

```json
{
  "topic": {
    "id": 256170,
    ....,
    "abilities": { "update": true, "destroy": true }
  }
}
```

- update 是否有权限修改
- destroy 是否有权限删除

## API 路由

API 的详细文档，请访问 [Api::V3](/api-doc/Api/V3.html) 阅读。

## 演示

我们用 Ruby 演示一下访问 [/api/v3/hello.json](/api-doc/Api/V3/RootController.html#hello-instance_method) 这个路径，其中包含 OAuth 2 的流程。

_这里用到 RubyGem [oauth2](https://github.com/intridea/oauth2)_

```rb
require "oauth2"
client = OAuth2::Client.new('client id', 'secret', site: 'https://ruby-china.org')
access_token = client.password.get_token('username', 'password')
res = Faraday.get("https://ruby-china.org/api/v3/hello.json?access_token=#{access_token.token}")
puts res.status
puts res.body

## ouath2.0
curl -i http://localhost:3000/oauth/token \
-F grant_type=password \
-F username=xxqfamous@gmail.com \
-F password=1212121111 \
-F client_id=c0d64bee \
-F client_secret=e27e6afbc8197108ef9027a6ff90310d055743f4c9720b5160fccce74a1f78a4
```

最后输出

```rb
{ 'current_user' : 'username' }
```



## 验证码 GET
curl http://localhost:3000/api/v3/auth/random_code -d mobile="13429151265" -G

## 登录 POST
curl -i http://localhost:3000/api/v3/auth/login \
-F username=15084992712 \
-F client_id=6a508bf2 \
-F client_secret=59cd57e9d4b11e49a9d5e5475f3952e3b39c547bbaed4424d980b271f22db70d

## 登录加验证码 POST
curl -i http://localhost:3000/api/v3/auth/login_or_register \
-F vcode=111222 \
-F username=15084992712 \
-F client_id=6a508bf2 \
-F client_secret=59cd57e9d4b11e49a9d5e5475f3952e3b39c547bbaed4424d980b271f22db70d

## 当前用户信息 GET
curl http://localhost:3000/api/v3/users/me.json?access_token=cf408a4734cd0b93c15ffe369651cdc0b1d76bb3f5a4c9a69c0c9a6bd62f63fb

## 广告商列表 GET
curl http://localhost:3000/api/v3/advertisers.json

## 广告商详情 GET http://localhost:3000/api/v3/advertisers/:id.json
curl http://localhost:3000/api/v3/advertisers/1.json

## Banner GET
curl http://106.14.213.161:3000/api/v3/banners

## 提现申请 POST
curl http://localhost:3000/api/v3/cashout_applies.json -d "access_token=cf408a4734cd0b93c15ffe369651cdc0b1d76bb3f5a4c9a69c0c9a6bd62f63fb" \
-d "cash_account=1322999191@163.com" \
-d "cash_name=老王" \
-d "amount=12" \

