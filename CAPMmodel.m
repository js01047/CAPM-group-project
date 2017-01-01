function [A,B,D]=CAPMmodel(fromdate,todate,nameofcompany,riskfreesecurity,market)
c =yahoo('http://download.finance.yahoo.com');
if riskfreesecurity='UK govt bond'
    field='Close';
    sec='UK GILT 5-10 (BG06.L)';
    A=fetch(c,sec,field,fromdate,todate,'w');
    
else riskfreesecurity~='UK govt bond';
    field='Close';
    sec='^TYX';
    A=fetch(c,sec,field,fromdate,todate,'w');
end
    
if market='FTSE 100'
    c=yahoo('http://download.finance.yahoo.com');
    field='Close';
    sec='^FTSE';
    B=fetch(c,sec,field,fromdate,todate,'w');
    
elseif market='S&P 500'
    field='Close';
    sec='^GSPC';
    B=fetch(c,sec,field,fromdate,todate,'w');
    
elseif market='Dow Jones Industrial Average'
    field='Close';
    sec='^DJI';
    B=fetch(c,sec,field,fromdate,todate,'w');
end  
sec=nameofcompany;
c =yahoo('http://download.finance.yahoo.com');
field = 'Close'; % retrieve closing price data
D= fetch(c,sec,field,fromdate,todate,'w');
close(c)
end