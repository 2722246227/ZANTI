require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "about1"--布局
activity.setTheme(android.R.style.Theme_DeviceDefault_Light_DarkActionBar)
activity.setContentView(loadlayout(about1))
--ActionBar返回按钮
activity.ActionBar.setDisplayHomeAsUpEnabled(true)
function onOptionsItemSelected(item)
  activity.finish()
end
--状态栏什么的
if Build.VERSION.SDK_INT>=21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff616161);
end
--设置ActionBar背景颜色
import "android.graphics.drawable.ColorDrawable"
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xff616161))
--自定义ActionBar标题颜色
import "android.text.SpannableString"
import "android.text.style.ForegroundColorSpan"
import "android.text.Spannable"
sp = SpannableString("关于与帮助")
sp.setSpan(ForegroundColorSpan(0xffffffff),0,#sp,Spannable.SPAN_EXCLUSIVE_INCLUSIVE)
activity.ActionBar.setTitle(sp)
activity.ActionBar.setElevation(0)
--滑动布局切换条
pagev.setOnPageChangeListener(PageView.OnPageChangeListener{
  onPageScrolled=function(a,b,c)
    if b==0 then
      return true
    end
    bq.setX(activity.getWidth()/2*b)
  end})
--按钮切换界面
c1.onClick=function()
  pagev.showPage(0)
end
c2.onClick=function()
  pagev.showPage(1)
end
import "android.graphics.Paint"
--设置下划线
gw.getPaint().setFlags(Paint. UNDERLINE_TEXT_FLAG )
--设置加粗
gw.getPaint().setFakeBoldText(true)
import "android.content.Intent"
import "android.net.Uri"
url="http://xstx.info"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
function gw.onClick()
  activity.startActivity(viewIntent)
end