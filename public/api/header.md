1. phb-serve接口，采用json进行报文数据交互<br/>

<ul>
<li>200, 201 - 请求成功，或执行成功。</li>
<li>400 - 参数不符合 API 的要求、或者数据格式验证没有通过，请配合 Response Body 里面的 error 信息确定问题。</li>
<li>401 - 用户认证失败，或缺少认证信息，比如 access_token 过期，或没传，可以尝试用 refresh_token 方式获得新的 access_token。</li>
<li>403 - 当前用户对资源没有操作权限。</li>
<li>404 - 资源不存在。</li>
<li>500 - 服务器异常。</li>
</ul>

3. http请求包含的头信息: Content-Type: application/json; charset=UTF-8 ,不带头部：请求带.json后缀
<br/>
4. 对于服务接口，正常响应信息格式为：
<br/>
<pre>
{
  status: true,
  msg: 
}
</pre>
<br/>
异常响应信息格式为:
<br/>
<pre>
{
  status : false,
  msg: "错误消息"
}
</pre>
5. 接口认证：<br/>
需要鉴权的接口都必须带有参数:access_token