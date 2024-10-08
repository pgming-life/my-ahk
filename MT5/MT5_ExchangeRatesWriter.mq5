#property copyright "(c) 2020-2024, pgming"

#property strict                    // 厳格なコンパイルモード用のコンパイラ指令
#property indicator_chart_window    // メインウィンドウ指定
#property indicator_plots 0         // プロットバッファ数

#define KEY_INSERT 45   // Insertキー

// グローバル変数
static string g_xySymbol;               // 現在シンボル名
static double g_nowRate;                // 現在レート
static string g_xjpySymbol = "NONE";    // 現在クロス円シンボル
static double g_yenRate = 0.0;          // 現在クロス円レート

// 初期化
int OnInit()
{
    // シンボル名取得
    g_xySymbol = _Symbol;
    
    /*
    XMTrading
    ------------
    NZDJPY      
    NZDCHF      
    NZDCAD      
    NZDUSD      
    AUDNZD      
    AUDJPY      
    AUDCHF      
    AUDCAD      
    AUDUSD      
    EURNZD      
    EURAUD      
    EURJPY      
    EURCHF      
    EURNOK      
    EURGBP      
    EURCAD      
    EURUSD      
    CHFJPY      
    GBPNZD      
    GBPAUD      
    GBPJPY      
    GBPCHF      
    GBPCAD      
    GBPUSD      
    CADJPY      
    CADCHF      
    USDJPY      
    USDCHF      
    USDNOK      
    USDCAD      
    GOLD        
    SILVER      
    JP225Cash   
    EU50Cash    
    GER40Cash   
    UK100Cash   
    US30Cash    
    US500Cash   
    US100Cash   
    OILCash     
    */
    
    // 以下、XM専用シンボル名ごとの処理
    if(g_xySymbol == "NZDJPY")
    {
        g_xySymbol = "NZDJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "NZDCHF")
    {
        g_xySymbol = "NZDCHF";
        g_xjpySymbol = "NZDJPY";
    }
    else if(g_xySymbol == "NZDCAD")
    {
        g_xySymbol = "NZDCAD";
        g_xjpySymbol = "NZDJPY";
    }
    else if(g_xySymbol == "NZDUSD")
    {
        g_xySymbol = "NZDUSD";
        g_xjpySymbol = "NZDJPY";
    }
    else if(g_xySymbol == "AUDNZD")
    {
        g_xySymbol = "AUDNZD";
        g_xjpySymbol = "AUDJPY";
    }
    else if(g_xySymbol == "AUDJPY")
    {
        g_xySymbol = "AUDJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "AUDCHF")
    {
        g_xySymbol = "AUDCHF";
        g_xjpySymbol = "AUDJPY";
    }
    else if(g_xySymbol == "AUDCAD")
    {
        g_xySymbol = "AUDCAD";
        g_xjpySymbol = "AUDJPY";
    }
    else if(g_xySymbol == "AUDUSD")
    {
        g_xySymbol = "AUDUSD";
        g_xjpySymbol = "AUDJPY";
    }
    else if(g_xySymbol == "EURNZD")
    {
        g_xySymbol = "EURNZD";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURAUD")
    {
        g_xySymbol = "EURAUD";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURJPY")
    {
        g_xySymbol = "EURJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "EURCHF")
    {
        g_xySymbol = "EURCHF";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURNOK")
    {
        g_xySymbol = "EURNOK";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURGBP")
    {
        g_xySymbol = "EURGBP";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURCAD")
    {
        g_xySymbol = "EURCAD";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "EURUSD")
    {
        g_xySymbol = "EURUSD";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "CHFJPY")
    {
        g_xySymbol = "CHFJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "GBPNZD")
    {
        g_xySymbol = "GBPNZD";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "GBPAUD")
    {
        g_xySymbol = "GBPAUD";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "GBPJPY")
    {
        g_xySymbol = "GBPJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "GBPCHF")
    {
        g_xySymbol = "GBPCHF";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "GBPCAD")
    {
        g_xySymbol = "GBPCAD";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "GBPUSD")
    {
        g_xySymbol = "GBPUSD";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "CADJPY")
    {
        g_xySymbol = "CADJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "CADCHF")
    {
        g_xySymbol = "CADCHF";
        g_xjpySymbol = "CADJPY";
    }
    else if(g_xySymbol == "USDJPY")
    {
        g_xySymbol = "USDJPY";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "USDCHF")
    {
        g_xySymbol = "USDCHF";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "USDNOK")
    {
        g_xySymbol = "USDNOK";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "USDCAD")
    {
        g_xySymbol = "USDCAD";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "GOLD")
    {
        g_xySymbol = "GOLD";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "SILVER")
    {
        g_xySymbol = "SILVER";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "JP225Cash")
    {
        g_xySymbol = "JP225Cash";
        g_xjpySymbol = "NONE";
    }
    else if(g_xySymbol == "EU50Cash")
    {
        g_xySymbol = "EU50Cash";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "GER40Cash")
    {
        g_xySymbol = "GER40Cash";
        g_xjpySymbol = "EURJPY";
    }
    else if(g_xySymbol == "UK100Cash")
    {
        g_xySymbol = "UK100Cash";
        g_xjpySymbol = "GBPJPY";
    }
    else if(g_xySymbol == "US30Cash")
    {
        g_xySymbol = "US30Cash";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "US500Cash")
    {
        g_xySymbol = "US500Cash";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "US100Cash")
    {
        g_xySymbol = "US100Cash";
        g_xjpySymbol = "USDJPY";
    }
    else if(g_xySymbol == "OILCash")
    {
        g_xySymbol = "OILCash";
        g_xjpySymbol = "USDJPY";
    }
    else
    {
        g_xySymbol = _Symbol;
        g_xjpySymbol = _Symbol;
    }
    
    // 成功結果を返す
    return INIT_SUCCEEDED;
}

// 終了時処理
void OnDeinit(const int reason)
{
}

// 描画
int OnCalculate(
    const int rates_total,      // チャートで表示されているバーのトータル数(インデックス数)
    const int prev_calculated,  // 前の呼び出しでのOnCalculate()の実行の結果(例えば、現在の値 rates_total = 1000 でprev_calculated = 999、各指標バッファでこの1つの値の計算を行うだけでよい)
    const datetime &time[],     // 時間定数バッファ
    const double &open[],       // 始値定数バッファ
    const double &high[],       // 高値定数バッファ
    const double &low[],        // 安値定数バッファ
    const double &close[],      // 終値定数バッファ
    const long &tick_volume[],  // ティックボリューム定数バッファ
    const long &volume[],       // 出来高定数バッファ
    const int &spread[]         // スプレッド定数バッファ
    )
{
    // 現在レート取得
    g_nowRate = close[rates_total - 1];
    
    // 現在クロス円レート取得
    MqlRates rates[];
    string numString;
    if(StringSubstr(string(TimeCurrent()), 14, 16) == "00")
    {
        numString = "59";
    }
    else if(StringSubstr(string(TimeCurrent()), 14, 16) == "01")
    {
        numString = "00";
    }
    else
    {
        numString = string(int(StringSubstr(string(TimeCurrent()), 14, 16)) - 1);
    }
    if(g_xjpySymbol == "NONE")
    {
        g_yenRate = 0.0;
        Comment("現在クロス円シンボルなし");
    }
    else
    {
        int rateCount = CopyRates(g_xjpySymbol, PERIOD_M1, datetime(StringSubstr(string(TimeCurrent()), 0, 14) + numString + StringSubstr(string(TimeCurrent()), 16, 19)), TimeCurrent(), rates);
        Comment("現在クロス円レートを読み込み中...");
        if(rateCount == 0)
        {
            // FX市場がクローズしている間は取得不可
            Comment("現在クロス円のM1レートを読み込めません。");
        }
        else
        {
            g_yenRate = rates[rateCount - 1].close;
        }
    }
    
    return 0;
}

// チャート上のイベント処理
void OnChartEvent(
    const int id,           // 「CHARTEVENT_KEYDOWN」が返される
    const long &lparam,     // 押された「キーのコード」が返される
    const double &dparam,   // 
    const string &sparam    // 
    )
{
    // キーボード上のキーが押されたら実行する
    if(id == CHARTEVENT_KEYDOWN && lparam == KEY_INSERT)
    {
        // ファイルオープン・新規作成(既にある場合は上書き)
        int handle = FileOpen("ExchangeRate.txt", FILE_WRITE | FILE_ANSI | FILE_TXT);
        
        // 書き込み
        FileWrite(handle, g_xySymbol);      // 現在のシンボル名[x/y]
        FileWrite(handle, g_nowRate);       // 現在シンボルのレート
        FileWrite(handle, g_xjpySymbol);    // 現在クロス円シンボル[x/jpy]
        FileWrite(handle, g_yenRate);       // 現在クロス円レート
        
        // ファイルクローズ
        FileClose(handle);
        
        // コメント
        Comment(g_xySymbol + " : " + string(TimeLocal()) + " - 出力済");
        
        // リフレッシュ
        ChartRedraw();
    }
}
