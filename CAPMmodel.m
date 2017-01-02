%In order to use UK govt bond's you will have to download the bloomberg
%software or have already downloaded the software. In order to download the
%latest software visit hhtp://www.bloomberg.com. Once the software has been
%downloaded in order to configure the software you will have to do as
%follows:
%1. If you have already downloaded blpapi3.jar, find it in a folder such as 
%c:\blp\DAPI\blpapi3.jar or search for it in the Bloomberg installation folder
%c:\blp.If you have not downloaded blpapi3.jar from Bloomberg, download it as follows:
%In the Bloomberg terminal, type WAPI <GO> to open the API Developer's Help Site screen.
%Click API Download Center. Download and install the appropriate software.
%2. Once you have blpapi3.jar on your system you will need to add it to the
%MATLAB java classpath. In order to do so use the javaaddpath function. Use
%the javaaddpath function with the bloomberg API path on your system within
%the brackets e.g. javaaddpath(c:\blp\API\blpapi3.jar)The JAR file path varies
%depending on the installed Bloomberg software.
%Then in order to check whether it has been added to the java classpath type java class path then hit enter.
%e.g. javaaddpath(c:\blp\API\blpapi3.jar)
%     java classpath
%if so it should appear in the list of java paths.


function [risk_free_security_data,market_data,company_data]=CAPMmodel(fromdate,todate,nameofcompany,riskfreesecurity,market)
c =yahoo('http://download.finance.yahoo.com');%establishing connection to yahoo

if strcmpi(riskfreesecurity,'US treasury bond')
 field='Close';%using the close price from yahoo finance
    sec='^TYX';%risk free security reference on yahoo
    risk_free_security_data=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the security between the specified dates, weekly(w)
    close(c)
 elseif strcmpi(riskfreesecurity,'UK govt bond')
    uuid = 12345678;
    serverip = '111.11.11.111';
    connection = blpsrv(uuid,serverip);%opening connection to bloomberg
    field='LAST_PRICE';%using the close price from yahoo finance
    sec='GUKG30:IND';%risk free security reference on yahoo
    risk_free_security_data=history(connection,sec,field,fromdate,todate,'weekly');
  %extracting data from yahoo finance for the security between the specified dates, weekly(w)
  close(connection) %close connection to bloomberg
end  
if strcmpi(market,'FTSE 100')
    c=yahoo('http://download.finance.yahoo.com');
    field='Close';%using the close price from yahoo finance
    sec='^FTSE';%market reference on yahoo
    market_data=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
    
elseif strcmpi(market,'S&P 500')
    field='Close';%using the close price from yahoo finance
    sec='^GSPC';%market reference on yahoo
    market_data=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
    
elseif strcmpi(market,'Dow Jones Industrial Average')
    field='Close';%using the close price from yahoo finance
    sec='^DJI';%market reference on yahoo
    market_data=fetch(c,sec,field,fromdate,todate,'w');
    %extracting data from yahoo finance for the market between the specified dates, weekly(w)
end  

sec=nameofcompany;
c =yahoo('http://download.finance.yahoo.com');
field = 'Close'; % retrieve closing price data
company_data= fetch(c,sec,field,fromdate,todate,'w');
%extracting data from yahoo finance for the security between the specified dates, weekly(w)

close(c)%close connection to yahoo
end
