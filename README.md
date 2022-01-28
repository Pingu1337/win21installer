# win21 installation script

 Detta är det officiella installations scriptet för win21 som installerar ALLA paket, extensions med mera som används under utbildningen.
 Scriptet kommer att uppdateras med tiden och då är det bara att köra det igen för att få de senaste uppdateringarna.

## Hur man använder scriptet

 1. Öppna upp windows startmeny, skriv in "cmd" och starta "Kommandotolken"
 2. Skriv in kommandot ``curl -V`` 
 - Om curl är installerat ska ni se något liknande: ``curl 7.79.1 (Windows) libcurl/7.79.1 Schannel``
 > 
 - - *Om ni får ett felmeddelande [läs mer om hur man installerar curl här](#curl)*
  3. Starta scriptet med följande kommando:<br/>
> ```
> curl -o win21install.bat https://raw.githubusercontent.com/Pingu1337/win21installer/main/Install.bat && ./win21install || win21install.bat && rm win21install.bat || del win21install.bat
> ```
 4. Låt scriptet köra färdigt, det kan ta **några minuter** beroende på uppkoppling.
 6. **Done!** Nu är allt installerat!
<br/>

>  *Ifall något redan är installerat så kommer det att ignoreras. Scriptet kan därför käras flera gånger utan att påverka befintliga filer*
> 
 *Fungerar inte scriptet som det ska?* *[öppna en issue](https://github.com/Pingu1337/win21installer/issues/new)*


# curl
curl är idag standard i windows datorer och bör finnas installerat med win10 eller senare.
Men om det skulle vara så att ni inte har curl installerat så är det inte särskillt svårt att installera manuellt.

Den senaste versionen av curl går att hämta här: https://curl.se/download.html
