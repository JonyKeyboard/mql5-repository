//+------------------------------------------------------------------+
//|                                       examples-of-indicators.mq5 |
//|                                                     Stanley Jony |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Stanley Jony"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(){return(INIT_SUCCEEDED);}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason){}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(){}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Relative Strength index                                                      |
//+------------------------------------------------------------------+
bool VerificaIFR(){

   //--var globais
   int handleIfr;
   double rsi[];

   //-- carregar indicador - no OnInit
   handleIfr = iRSI(_Symbol,_Period,14,PRICE_CLOSE);
   
   ArraySetAsSeries(rsi, true);
   
   CopyBuffer(handleIfr, 0, 0, 5,rsi);
   
   return true;
}

//+------------------------------------------------------------------+
//| Stochastic                                                  |
//+------------------------------------------------------------------+
bool VerificaEstocasticoLento(){

   //-- var globais
   int handleStoch;
   double stoch[];
   double signal[]; 
   
   //-- carregar indicador - no OnInit
   handleStoch = iStochastic(_Symbol, _Period, 8, 3, 3, MODE_EMA, STO_LOWHIGH);
   
   //-- carregar dados
   ArraySetAsSeries(stoch, true);   
   ArraySetAsSeries(signal, true);
   
   CopyBuffer(handleStoch, 0, 0, 3, stoch);
   CopyBuffer(handleStoch, 1, 0, 3, signal);
   
   return true;
}

//+------------------------------------------------------------------+
//| Bollinger Bands                                                  |
//+------------------------------------------------------------------+
bool VerificaBandasDeBollinger(){
   
   //-- var globais
   int handleBB;
   double upBand[];
   double middleBand[];
   double lowBand[];
   
   //-- carregar indicador - no OnInit
   handleBB = iBands(_Symbol, _Period, 20,0, 2.00, PRICE_CLOSE);
   
   //-- carregar dados
   ArraySetAsSeries(upBand, true);   
   ArraySetAsSeries(middleBand, true);
   ArraySetAsSeries(lowBand, true);
   
   CopyBuffer(handleBB, 0, 0, 5, middleBand);
   CopyBuffer(handleBB, 1, 0, 5, upBand);
   CopyBuffer(handleBB, 2, 0, 5, lowBand);
   
   return true;
}
//+------------------------------------------------------------------+
//| Moving Average                                                  |
//+------------------------------------------------------------------+
bool VerificaMediaMovel(){
   
   //-- var globais
   int handleMedia;
   double media[];
   
   //-- carregar indicador - no OnInit
   handleMedia = iMA(_Symbol, _Period, 20, 0, MODE_SMA, PRICE_CLOSE);
   
   //-- carregar dados
   ArraySetAsSeries(media, true);
   
   CopyBuffer(handleMedia, 0, 0, 3, media);
   
   return true;
}
