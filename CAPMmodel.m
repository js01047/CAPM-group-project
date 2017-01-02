function [A,B,D]=CAPMmodel(fromdate,todate,nameofcompany,riskfreesecurity,market)
c =yahoo('http://download.finance.yahoo.com');%establishing connection to yahoo

if  strcmpi(riskfreesecurity,'US treasury bond')
    field='Close';%using the close price from yahoo finance
    sec='^TYX';%risk free security reference on yahoo
    A=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the security between the specified dates, weekly(w)
 
elseif strcmpi(riskfreesecurity,'UK govt bond')
    field='Close';%using the close price from yahoo finance
    sec='BG06.L';%risk free security reference on yahoo
    A=fetch(c,sec,field,fromdate,todate,'w');
 %extracting data from yahoo finance for the security between the specified dates, weekly(w)
end  
if strcmpi(market,'FTSE 100')
    c=yahoo('http://download.finance.yahoo.com');
    field='Close';%using the close price from yahoo finance
    sec='^FTSE';%market reference on yahoo
    B=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
    
elseif strcmpi(market,'S&P 500')
    field='Close';%using the close price from yahoo finance
    sec='^GSPC';%market reference on yahoo
    B=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
    
elseif strcmpi(market,'Dow Jones Industrial Average')
    field='Close';%using the close price from yahoo finance
    sec='^DJI';%market reference on yahoo
    B=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
end  

sec=nameofcompany;
c =yahoo('http://download.finance.yahoo.com');
field = 'Close'; % retrieve closing price data
D= fetch(c,sec,field,fromdate,todate,'w');
%extracting data from yahoo finance for the security between the specified dates, weekly(w)

close(c)%close connection to yahoo
end
