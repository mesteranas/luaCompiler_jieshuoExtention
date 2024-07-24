require "import"
import "android.widget.*"
import "android.view.*"
layout={
    LinearLayout;
    {
        EditText;
        hint="type lua code";
        id="code"
    };
    {
        Button;
        text="run";
        onClick=function()
            local result,error=loadstring(code.getText().toString())
            if result then
                local success,output=pcall(result)
                resultText.setText(tostring(output))
            else
                resultText.setText(tostring(error))
            end
        end;
    };
    {
        TextView;
        id="resultText";
    }
}
dlg=LuaDialog()
dlg.setTitle("lua compiler")
dlg.setMessage("hello in this tool you can type lua code and get result")
dlg.setView(loadlayout(layout))
dlg.show()