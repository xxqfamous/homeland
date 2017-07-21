/**
 * Created by maievshabu on 2017/2/9.
 */

/**
 * @api  {get} api/v3/auth/reg_mobile_code 发送手机验证码
 * @apiVersion 0.1.0
 * @apiname reg_mobile_code
 * @apiGroup Login
 * @apiParam {String} mobile 手机号码
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/auth/reg_mobile_code
 *
 * @apiError Mobile  手机号码格式错误／或者手机号码为空
 *
 */



/**
 * @api  {post} api/v3/auth/login_or_register 用户登录或注册
 * @apiVersion 0.1.0
 * @apiname login_or_register
 * @apiGroup Login
 * @apiParam {String} username 手机号码
 * @apiParam {String} vcode 手机验证码
 * @apiParam {String} client_id 授权认证码 6a508bf2
 * @apiParam {String} client_secret 授权认证码 59cd57e9d4b11e49a9d5e5475f3952e3b39c547bbaed4424d980b271f22db70d
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 * @apiSuccess {String}   access_token   授权认证
 * @apiSuccess {Object}   data      数据对象
 *
 * @apiSampleRequest api/v3/auth/login_or_register
 *
 * @apiError Mobile  用户名或密码不正确
 *
 */



/**
 * @api  {get} api/v3/users/me.json 当前用户信息
 * @apiVersion 0.1.0
 * @apiname me
 * @apiGroup Login
 * @apiParam {String} access_token 授权认证
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/auth/random_code
 *
 * @apiError Mobile  手机号码格式错误／或者手机号码为空
 *
 */



 /**
 * @api  {get} api/v3/advertisers.json 广告商列表
 * @apiVersion 0.1.0
 * @apiname advertisers
 * @apiGroup advertisers
 *
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   advertisers
 *
 * @apiSampleRequest api/v3/advertisers
 *
 *
 */

/**
 * @api  {get} api/v3/advertisers/:id.json 广告商详情
 * @apiVersion 0.1.0
 * @apiname advertiser/:id.json
 * @apiGroup advertisers
 *
 * @apiSuccess {Object}   advertiser
 *
 * @apiSampleRequest api/v3/advertisers/1.json
 *
 *
 */


/**
 * @api  {get} api/v3/banners.json 首页banner
 * @apiVersion 0.1.0
 * @apiname banners
 * @apiGroup banners
 *
 * @apiSuccess {String}   count
 * @apiSuccess {String}   total_pages
 * @apiSuccess {String}   current_page
 * @apiSuccess {Object}   banners
 *
 * @apiSampleRequest api/v3/banners.json
 *
 *
 */

/**
 * @api  {post} api/v3/cashout_applies.json 用户提现
 * @apiVersion 0.1.0
 * @apiname me
 * @apiGroup User
 * @apiParam {String} access_token 授权认证
 * @apiParam {String} cash_account 提现支付宝账号
 * @apiParam {String} cash_name 提现姓名
 * @apiParam {Number} amount 提现金额
 *
 * @apiSuccess {String}   status   正确错误
 * @apiSuccess {String}   mgs   消息
 *
 * @apiSampleRequest api/v3/cashout_applies.json
 *
 * @apiError Mobile  手机号码格式错误／或者手机号码为空
 *
 */
