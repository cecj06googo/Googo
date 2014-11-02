設計器雛形測試說明

前置準備
insert into Accessory (com_id, acc_detail, acc_price) values (2, '配備01', 100)
insert into Accessory (com_id, acc_detail, acc_price) values (2, '配備01', 200)
insert into Accessory (com_id, acc_detail, acc_price) values (2, '配備01', 300)
insert into Accessory (com_id, acc_detail, acc_price) values (2, '配備01', 400)
insert into Accessory (com_id, acc_detail, acc_price) values (2, '配備01', 500)

測試流程
1. 啟動ApplySample.jsp，進行簡單設計，會連結配備資料表的元件在predefined頁籤
2. 在com_id處提供公司編號，按Save Form for View存入設計結果
3. 啟動ViewSample.jsp，提供公司編號與表單模板編號（參考資料庫的實際內容輸入），取出設計結果
*目前只完成架構與最簡單的新增功能，還未整合登入，接下來的任務是設計器直接編輯已存表單、增加自訂元件類型、還有debug debug debug...

 - 展示層

ApplySample.jsp
表單設計器畫面，右方predefined頁籤有一個預設元件predefined select basic，此元件會連結到配備資料表accessory，動態產生select的選項，文字內容是配備說明，選項的value是價錢。
目前此功能尚未整合登入，暫時寫死，固定讀取店家編號2的配備資料，請先利用以上sql指令新增店家編號2的配備資料。

ViewSample.jsp
測試資料輸出畫面，從ApplySample.jsp存入的設計結果，在此使用商家id與表單模板id讀出，嵌入在預設的空白form裡。


 - controller

Prototype_OrderTemp_Servlet
接受展示層兩支jsp請求，存入或取出表單設計結果


 - model
 
Prototype_OrderTemp_DAO, Prototype_OrderTemp_VO
 進行資料庫讀寫
 
Accessory_Retrieval
讀取配備資料並回傳json，提供設計器使用


 - 設計器需要的程式
幾個js檔、css檔、以及options資料夾，有點雜，當面說明


 - 整合問題
我配置完之後，原WebContent下面的其他js出現紅叉叉，在 js/plugins/flot/jquery.flot.js。
目前尚未找出原因和解法，請原來配置此plugin的夥伴重新放一次試試，sorry  Orz...