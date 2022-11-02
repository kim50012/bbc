/**   
* @Title: ExcelSheet.java 
* @Package com.waremec.framework.utilities 
* @Description:  
* @author taebem
* @date 2015年6月24日 上午11:47:27 
* @version V1.0   
*/
package com.waremec.framework.utilities;

import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/** 
 * @Package com.waremec.framework.utilities 
 * @FileName ExcelSheet
 * @Description  <pre>
 *   String is align : left or center 
 *   Number is align : right 
 *      Number Type : #,###,###,###
 *                    #,###,###.0
 *                    #,###,###.#0
 *                    #,###,###.##0
 *                    #,###,###.###0
 *                    #,###,###.####0
 *                    #,###,###.#####0
 * 
 * 
 * </pre>
 * @author taebem 
 * @date 2015年6月24日 上午11:47:27 
 *  
 */
public class ExcelSheet {
    
    static Logger       logger      = Logger.getLogger(ExcelSheet.class);
    
    String              columnCd    = "'Title'";
    Map<String, Object> menuParam   = new HashMap<String, Object>();
    Map<String, Object> menuReturns = new HashMap<String, Object>();
    
    String              pageName;
    String[]            infoHeaders;
    String[]            infoContents;
    
    String[]            title0;
    int[][]             titleSpan;
    String[]            title;
    String[]            align;
    String[][]          contents;
    String              reportSign;
    String              reportTitle;
    String              reportContents;
    
    int                 sFixrow     = 0;
    double              numData     = 0;
    String              midStyle    = "";
    StopWatch           stopWatch;
    
    public ExcelSheet(Map<String, Object> menuReturns) {
        stopWatch = new StopWatch();
        logger.debug("[STARTEXCEL] = " + this.hashCode() + " start time : "
                + stopWatch.getElapsed() + "ms.");
        this.menuReturns = menuReturns;
    }
    
    private final static String pageHeader = "<html xmlns:o='urn:schemas-microsoft-com:office:office'xmlns:x='urn:schemas-microsoft-com:office:excel'xmlns='http://www.w3.org/TR/REC-html40'>";
    private final static String pageStyle  = "<head>"
                                                   + "<meta http-equiv=Content-Type content='text/html; charset=UTF-8'>"
                                                   + "<meta name=ProgId content=Excel.Sheet>"
                                                   + "<meta name=Generator content='Microsoft Excel 9'>"
                                                   + "<style>"
                                                   + "<!--table"
                                                   + "  {mso-displayed-decimal-separator:'\\.';mso-displayed-thousand-separator:'\\,';}"
                                                   + "@page"
                                                   + "  {margin:1.0in .75in 1.0in .75in;mso-header-margin:.5in;mso-footer-margin:.5in;}"
                                                   + "tr"
                                                   + "  {mso-height-source:auto;mso-ruby-visibility:none;}"
                                                   + "col"
                                                   + "  {mso-width-source:auto;mso-ruby-visibility:none;}"
                                                   + "br"
                                                   + "  {mso-data-placement:same-cell;}"
                                                   + ".style0"
                                                   + "  {mso-number-format:General;"
                                                   + "  text-align:general;"
                                                   + "  vertical-align:bottom;"
                                                   + "  white-space:nowrap;"
                                                   + "  mso-rotate:0;"
                                                   + "  mso-background-source:auto;"
                                                   + "  mso-pattern:auto;"
                                                   + "  color:windowtext;"
                                                   + "  font-size:11.0pt;"
                                                   + "  font-weight:400;"
                                                   + "  font-style:normal;"
                                                   + "  text-decoration:none;"
                                                   + "  font-family:arial;"
                                                   + "  mso-font-charset:0;"
                                                   + "  border:none;"
                                                   + "  mso-protection:locked visible;"
                                                   + "  mso-style-name:\\D45C\\C900;"
                                                   + "  mso-style-id:0;}"
                                                   + "td"
                                                   + "  {mso-style-parent:style0;"
                                                   + "  padding-top:1px;"
                                                   + "  padding-right:1px;"
                                                   + "  padding-left:1px;"
                                                   + "  mso-ignore:padding;"
                                                   + "  color:windowtext;"
                                                   + "  font-size:9pt;"
                                                   + "  font-weight:400;"
                                                   + "  font-style:normal;"
                                                   + "  text-decoration:none;"
                                                   // +" font-family:Arial, sans-serif;"
                                                   + "  font-family:arial;"
                                                   + "  mso-font-charset:0;"
                                                   + "  mso-number-format:General;"
                                                   + "  text-align:general;"
                                                   + "  vertical-align:bottom;"
                                                   + "  border:none;"
                                                   + "  mso-background-source:auto;"
                                                   + "  mso-pattern:auto;"
                                                   + "  mso-protection:locked visible;"
                                                   + "  white-space:nowrap;"
                                                   + "  mso-rotate:0;}"
                                                   + ".xl24"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl25"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:.5pt solid windowtext;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl26"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'###0';"
                                                   + "  text-align:left;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;}"
                                                   + ".xl27"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:left;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:none;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;}"
                                                   + ".xl28"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:left;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:none;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:.5pt solid black;}"
                                                   + ".xl29"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:left;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:.5pt solid black;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;}"
                                                   + ".xl30"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  vertical-align:middle;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:none;"
                                                   + "  border-left:.5pt solid windowtext;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl31"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  vertical-align:middle;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid black;"
                                                   + "  border-left:.5pt solid windowtext;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl32"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:none;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl33"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:none;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:.5pt solid windowtext;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl34"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:bold;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:.5pt solid black;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;"
                                                   + "  white-space:normal;}"
                                                   + ".xl35"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'###0';"
                                                   + "  text-align:center;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;}"
                                                   + ".xl36"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'###0';"
                                                   + "  text-align:right;"
                                                   + "  border-top:none;"
                                                   + "  border-right:.5pt solid windowtext;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;}"
                                                   + ".xl37"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:right;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:none;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:.5pt solid windowtext;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl38"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:700;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:right;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:.5pt solid black;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;"
                                                   + "  background:#789ECF;"
                                                   + "  mso-pattern:auto none;}"
                                                   + ".xl39"
                                                   + " {mso-style-parent:style0;"
                                                   + "  mso-number-format:'\\@';}"
                                                   + ".xl40"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl41"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.0_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl42"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.00_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl43"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.000_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl44"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.0000_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl45"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.00000_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl46"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-size:9.0pt;"
                                                   + "mso-number-format:\"0\\.000000_ \";"
                                                   + "text-align:right;"
                                                   + "border-top:none;"
                                                   + "border-right:.5pt solid windowtext;"
                                                   + "border-bottom:.5pt solid windowtext;"
                                                   + "border-left:none;}"
                                                   + ".xl47"
                                                   + " {mso-style-parent:style0;"
                                                   + "  font-weight:bold;"
                                                   + "  mso-number-format:'\\@';"
                                                   + "  text-align:center;"
                                                   + "  border-top:.5pt solid windowtext;"
                                                   + "  border-right:.5pt solid black;"
                                                   + "  border-bottom:.5pt solid windowtext;"
                                                   + "  border-left:none;"
                                                   + "  background:#FFFF00;"
                                                   + "  mso-pattern:auto none;"
                                                   + "  white-space:normal;}"
                                                   + "ruby"
                                                   + "  {ruby-align:left;}"
                                                   + "rt"
                                                   + "  {color:windowtext;"
                                                   + "  font-size:8.0pt;"
                                                   + "  font-weight:400;"
                                                   + "  font-style:normal;"
                                                   + "  text-decoration:none;"
                                                   // +" font-family:arial, sans-serif;"
                                                   + "  font-family:arial;"
                                                   + "  mso-font-charset:0;"
                                                   + "  mso-char-type:none;"
                                                   + "  display:none;}"
                                                   + "-->"
                                                   + "</style>"
                                                   + "<!--[if gte mso 9]><xml>"
                                                   + " <x:ExcelWorkbook>"
                                                   + "  <x:ExcelWorksheets>"
                                                   + "   <x:ExcelWorksheet>"
                                                   + "    <x:Name>Sheet1</x:Name>"
                                                   + "    <x:WorksheetOptions>"
                                                   + "     <x:DefaultRowHeight>285</x:DefaultRowHeight>"
                                                   + "     <x:Print>"
                                                   + "      <x:ValidPrinterInfo/>"
                                                   + "      <x:PaperSizeIndex>9</x:PaperSizeIndex>"
                                                   + "      <x:HorizontalResolution>600</x:HorizontalResolution>"
                                                   + "      <x:VerticalResolution>0</x:VerticalResolution>"
                                                   + "     </x:Print>" + "     <x:Selected/>";
    
    private final static String afterStyle = "     <x:Panes>"
                                                   + "      <x:Pane>"
                                                   + "       <x:Number>3</x:Number>"
                                                   + "       <x:ActiveRow>9</x:ActiveRow>"
                                                   + "       <x:ActiveCol>2</x:ActiveCol>"
                                                   + "      </x:Pane>"
                                                   + "     </x:Panes>"
                                                   + "     <x:ProtectContents>False</x:ProtectContents>"
                                                   + "     <x:ProtectObjects>False</x:ProtectObjects>"
                                                   + "     <x:ProtectScenarios>False</x:ProtectScenarios>"
                                                   + "    </x:WorksheetOptions>"
                                                   + "   </x:ExcelWorksheet>"
                                                   + "   <x:ExcelWorksheet>"
                                                   + "    <x:Name>Sheet2</x:Name>"
                                                   + "    <x:WorksheetOptions>"
                                                   + "     <x:DefaultRowHeight>285</x:DefaultRowHeight>"
                                                   + "     <x:Print>"
                                                   + "      <x:ValidPrinterInfo/>"
                                                   + "      <x:PaperSizeIndex>9</x:PaperSizeIndex>"
                                                   + "      <x:HorizontalResolution>600</x:HorizontalResolution>"
                                                   + "      <x:VerticalResolution>0</x:VerticalResolution>"
                                                   + "     </x:Print>"
                                                   + "     <x:ProtectContents>False</x:ProtectContents>"
                                                   + "     <x:ProtectObjects>False</x:ProtectObjects>"
                                                   + "     <x:ProtectScenarios>False</x:ProtectScenarios>"
                                                   + "    </x:WorksheetOptions>"
                                                   + "   </x:ExcelWorksheet>"
                                                   + "   <x:ExcelWorksheet>"
                                                   + "    <x:Name>Sheet3</x:Name>"
                                                   + "    <x:WorksheetOptions>"
                                                   + "     <x:DefaultRowHeight>285</x:DefaultRowHeight>"
                                                   + "     <x:Print>"
                                                   + "      <x:ValidPrinterInfo/>"
                                                   + "      <x:PaperSizeIndex>9</x:PaperSizeIndex>"
                                                   + "      <x:HorizontalResolution>600</x:HorizontalResolution>"
                                                   + "      <x:VerticalResolution>0</x:VerticalResolution>"
                                                   + "     </x:Print>"
                                                   + "     <x:ProtectContents>False</x:ProtectContents>"
                                                   + "     <x:ProtectObjects>False</x:ProtectObjects>"
                                                   + "     <x:ProtectScenarios>False</x:ProtectScenarios>"
                                                   + "    </x:WorksheetOptions>"
                                                   + "   </x:ExcelWorksheet>"
                                                   + "  </x:ExcelWorksheets>"
                                                   + "  <x:WindowHeight>13050</x:WindowHeight>"
                                                   + "  <x:WindowWidth>16545</x:WindowWidth>"
                                                   + "  <x:WindowTopX>240</x:WindowTopX>"
                                                   + "  <x:WindowTopY>105</x:WindowTopY>"
                                                   + "  <x:ProtectStructure>False</x:ProtectStructure>"
                                                   + "  <x:ProtectWindows>False</x:ProtectWindows>"
                                                   + " </x:ExcelWorkbook>" + "</xml><![endif]-->"
                                                   + "</head>";
    
    // set properties...
    public void setPageName(String pageName) {
        this.pageName = pageName;
    }
    
    public void setInfoHeaders(String[] infoHeaders) {
        this.infoHeaders = infoHeaders;
    }
    
    public void setInfoContents(String[] infoContents) {
        this.infoContents = infoContents;
    }
    
    public void setTitle0(String[] title0) {
        this.title0 = title0;
    }
    
    public void setTitleSpan(int[][] titleSpan) {
        this.titleSpan = titleSpan;
    }
    
    public void setTitle(String[] title) {
        if (title0 != null)
            setFixrow(infoHeaders.length + 4);
        else
            setFixrow(infoHeaders.length + 3);
        this.title = title;
    }
    
    public void setAlign(String[] align) {
        this.align = align;
    }
    
    public void setContents(String[][] contents) {
        this.contents = contents;
    }
    
    public void setFixrow(int sFixrow) {
        StringBuffer buf = new StringBuffer();
        buf.append(" <x:FreezePanes/>                                        ")
                .append("  <x:FrozenNoSplit/>                                      ")
                .append("  <x:FrozenNoSplit/>                                      ")
                .append("  <x:SplitHorizontal>").append(sFixrow)
                .append("</x:SplitHorizontal>      ").append("  <x:TopRowBottomPane>")
                .append(sFixrow).append("</x:TopRowBottomPane>    ")
                .append("  <x:ActivePane>2</x:ActivePane>                          ");
        this.midStyle = buf.toString();
    }
    
    // make Excel Sheet...
    private String makeInfoHeader() {
        StringBuffer sbf = new StringBuffer();
        // make body...
        sbf.append("<body link=blue vlink=purple>"
                + "<table x:str border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse;table-layout:fixed'>");
        // make page name...
        if (pageName != null) {
            sbf.append("<tr><td  colspan=2  bgcolor='#789ECF' class=xl34 style='border-right:.5pt solid black;' ><div align='right'><font color='#ffffff'>"
                    + (String) menuReturns.get("Title")
                    + "</font></div></td>"
                    + "<td colspan="
                    + (align.length - 1)
                    + " class=xl28 style='border-right:.5pt solid black; border-left:none;'>"
                    + pageName + "</td></tr>");
        }
        // make infomation header...
        if (infoHeaders != null && infoContents != null) {
            for (int idx = 0; idx < infoHeaders.length; idx++)
                sbf.append("<tr><td  colspan=2 bgcolor='#789ECF' class=xl34 style='border-right:.5pt solid black;' ><div align='right'><font color='#ffffff'>"
                        + infoHeaders[idx]
                        + "</font></div></td>"
                        + "<td colspan="
                        + (align.length - 1)
                        + " class=xl28 style='border-right:.5pt solid black; border-left:none;'>"
                        + infoContents[idx] + "</td></tr>");
        }
        
        // make interval
        sbf.append("<tr>    <td>&nbsp;</td></tr>");
        
        return sbf.toString();
    }
    
    @SuppressWarnings("unused")
    private String makeMainTable() {
        StringBuffer sbf = new StringBuffer();
        
        // make table header...
        if (title0 == null) // simple type...
        {
            sbf.append("<tr>");
            if (title != null) {
                sbf.append("<td class=xl34><font color='#ffffff'>No.</font></td>");
                for (int idx = 0; idx < title.length; idx++)
                    sbf.append("<td class=xl34><font color='#ffffff'>" + title[idx]
                            + "</font></td>");
            }
            sbf.append("</tr>");
            
        }
        else { // two row type...
        
            sbf.append("<tr>");
            if (title0 != null) {
                sbf.append("<td class=xl34 rowspan=2 style='border-bottom:.5pt solid black'><font color='#ffffff'>No.</font></td>");
                for (int idx = 0; idx < title0.length; idx++) {
                    if (titleSpan[idx][0] > 1 && titleSpan[idx][1] > 1)
                        sbf.append("<td colspan="
                                + titleSpan[idx][1]
                                + " rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    else if (titleSpan[idx][0] > 1) // rowspan
                        sbf.append("<td rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    else if (titleSpan[idx][1] > 0) // colspan
                        sbf.append("<td colspan="
                                + titleSpan[idx][1]
                                + " class=xl34 style='border-right:.5pt solid black;border-left:none'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    
                }
            }
            
            sbf.append("</tr>");
            
            sbf.append("<tr>");
            if (title != null) {
                for (int idx = 0; idx < title.length; idx++)
                    sbf.append("<td class=xl34><font color='#ffffff'>" + title[idx]
                            + "</font></td>");
            }
            sbf.append("</tr>");
            
        }
        // make table body...
        if (contents != null) {
            java.text.NumberFormat nf = null;
            String parseStr = "";
            boolean numberExcep = false;
            Number numObj = null;
            String numStr = "";
            String classStr = "";
            int intNum = 0;
            int realLength = 0;
            for (int row = 0, num = 1; row < contents.length; row++, num++) {
                sbf.append("<tr><td class=xl35>" + num + "</td>");
                
                for (int col = 0; col < align.length; col++) {
                    
                    nf = java.text.NumberFormat.getInstance();
                    parseStr = "";
                    numberExcep = false;
                    try {
                        if (contents[row][col].indexOf("%") == -1) {
                            parseStr = HtmlParseUtil.htmlParse(contents[row][col], -1);
                            numObj = nf.parse(parseStr);
                            numData = numObj.doubleValue();
                        }
                        else {
                            throw new Exception();
                        }
                    }
                    catch (Exception e) {
                        numData = -1;
                        numberExcep = true;
                    }
                    
                    numStr = "";
                    classStr = "class=xl36";
                    
                    if (!numberExcep && "right".equals(align[col])) {
                        intNum = 0;
                        realLength = 0;
                        
                        try {
                            intNum = parseStr.indexOf(".") + 1;
                            realLength = parseStr.length() - intNum;
                        }
                        catch (Exception e) {
                            logger.error("number length format error", e);
                        }
                        
                        if (realLength > 6)
                            realLength = 6;
                        
                        if (intNum > 1 && realLength > 0 && realLength < 7)
                            classStr = "class=xl4" + realLength;
                        else
                            classStr = "class=xl40";
                        
                        numStr = "x:num=\"" + numData + "\"";
                    }
                    else if ("left".equals(align[col])) {
                        classStr = "class=xl26";
                        numStr = "";
                    }
                    else if ("center".equals(align[col])) {
                        classStr = "class=xl35";
                        numStr = "";
                    }
                    else {
                        classStr = "class=xl36";
                        numStr = "";
                    }
                    
                    sbf.append("<td " + classStr + " " + numStr + " >" + contents[row][col]
                            + "</td>");
                    
                } // rof col
                sbf.append("</tr>");
            } // rof row
        } // fi
        return sbf.toString();
    }
    
    private String makeBottom() {
        return "</table></body></html>";
        
    }
    
    private void outWriterMainTable(Writer out)
            throws IOException {
        // make table header...
        if (title0 == null) // simple type...
        {
            out.write("<tr>");
            if (title != null) {
                out.write("<td class=xl34><font color='#ffffff'>No.</font></td>");
                for (int idx = 0; idx < title.length; idx++)
                    out.write("<td class=xl34><font color='#ffffff'>" + title[idx] + "</font></td>");
            }
            out.write("</tr>");
        }
        else { // two row type...
            out.write("<tr>");
            if (title0 != null) {
                out.write("<td class=xl34 rowspan=2 style='border-bottom:.5pt solid black'><font color='#ffffff'>No.</font></td>");
                for (int idx = 0; idx < title0.length; idx++) {
                    if (titleSpan[idx][0] > 1 && titleSpan[idx][1] > 1)
                        out.write("<td colspan="
                                + titleSpan[idx][1]
                                + " rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    else if (titleSpan[idx][0] > 1) // rowspan
                        out.write("<td rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    else if (titleSpan[idx][1] > 0) // colspan
                        out.write("<td colspan="
                                + titleSpan[idx][1]
                                + " class=xl34 style='border-right:.5pt solid black;border-left:none'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>");
                    
                }
            }
            out.write("</tr><tr>");
            
            if (title != null) {
                for (int idx = 0; idx < title.length; idx++)
                    out.write("<td class=xl34><font color='#ffffff'>" + title[idx] + "</font></td>");
            }
            out.write("</tr>");
        }
        
        // make table body...
        if (contents != null) {
            java.text.NumberFormat nf = null;
            String parseStr = "";
            boolean numberExcep = false;
            Number numObj = null;
            String numStr = "";
            String classStr = "";
            int intNum = 0;
            int realLength = 0;
            for (int row = 0, num = 1; row < contents.length; row++, num++) {
                out.write("<tr><td class=xl35>" + num + "</td>");
                for (int col = 0; col < align.length; col++) {
                    nf = java.text.NumberFormat.getInstance();
                    parseStr = "";
                    numberExcep = false;
                    try {
                        if (contents[row][col].indexOf("%") == -1) {
                            parseStr = HtmlParseUtil.htmlParse(contents[row][col], -1);
                            numObj = nf.parse(parseStr);
                            numData = numObj.doubleValue();
                        }
                        else {
                            throw new Exception();
                        }
                    }
                    catch (Exception e) {
                        numData = -1;
                        numberExcep = true;
                    }
                    
                    numStr = "";
                    classStr = "class=xl36";
                    if (!numberExcep && "right".equals(align[col])) {
                        intNum = parseStr.indexOf(".") + 1;
                        realLength = parseStr.length() - intNum;
                        
                        if (realLength > 6)
                            realLength = 6;
                        
                        if (intNum > 1 && realLength > 0 && realLength < 7)
                            classStr = "class=xl4" + realLength;
                        else
                            classStr = "class=xl40";
                        numStr = "x:num='" + numData + "'";
                    }
                    else if ("left".equals(align[col])) {
                        classStr = "class=xl26";
                    }
                    else if ("center".equals(align[col])) {
                        classStr = "class=xl35";
                    }
                    else {
                        classStr = "class=xl36";
                    }
                    
                    out.write("<td " + classStr + " " + numStr + " >" + contents[row][col]
                            + "</td>");
                    
                } // rof col
                out.write("</tr>");
            } // rof row
        } // fi
        return;
    }
    
    private void outStreamMainTable(DataOutputStream dataOut)
            throws IOException {
        // make table header...
        if (title0 == null) // simple type...
        {
            dataOut.write(getUTFByteArry("<tr>"));
            if (title != null) {
                dataOut.write(getUTFByteArry("<td class=xl34><font color='#ffffff'>No.</font></td>"));
                for (int idx = 0; idx < title.length; idx++)
                    dataOut.write(getUTFByteArry("<td class=xl34><font color='#ffffff'>"
                            + title[idx] + "</font></td>"));
            }
            dataOut.write(getUTFByteArry("</tr>"));
            
        }
        else { // two row type...
            dataOut.write(getUTFByteArry("<tr>"));
            if (title0 != null) {
                dataOut.write(getUTFByteArry("<td class=xl34 rowspan=2 style='border-bottom:.5pt solid black'><font color='#ffffff'>No.</font></td>"));
                for (int idx = 0; idx < title0.length; idx++) {
                    if (titleSpan[idx][0] > 1 && titleSpan[idx][1] > 1)
                        dataOut.write(getUTFByteArry("<td colspan="
                                + titleSpan[idx][1]
                                + " rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>"));
                    else if (titleSpan[idx][0] > 1) // rowspan
                        dataOut.write(getUTFByteArry("<td rowspan=2 class=xl34 style='border-bottom:.5pt solid black'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>"));
                    else if (titleSpan[idx][1] > 0) // colspan
                        dataOut.write(getUTFByteArry("<td colspan="
                                + titleSpan[idx][1]
                                + " class=xl34 style='border-right:.5pt solid black;border-left:none'><font color='#ffffff'>"
                                + title0[idx] + "</font></td>"));
                    
                }
            }
            dataOut.write(getUTFByteArry("</tr><tr>"));
            
            if (title != null) {
                for (int idx = 0; idx < title.length; idx++)
                    dataOut.write(getUTFByteArry("<td class=xl34><font color='#ffffff'>"
                            + title[idx] + "</font></td>"));
            }
            dataOut.write(getUTFByteArry("</tr>"));
        }
        
        if (StringUtils.isNotBlank(reportSign)) {
            if (StringUtils.isNotBlank(reportTitle)) {
                dataOut.write(getUTFByteArry(reportTitle));
            }
            if (StringUtils.isNotBlank(reportContents)) {
                dataOut.write(getUTFByteArry(reportContents));
            }
        }
        
        // make table body...
        if (contents != null) {
            java.text.NumberFormat nf = null;
            String parseStr = "";
            boolean numberExcep = false;
            Number numObj = null;
            String numStr = "";
            String classStr = "";
            int intNum = 0;
            int realLength = 0;
            for (int row = 0, num = 1; row < contents.length; row++, num++) {
                dataOut.write(getUTFByteArry("<tr><td class=xl35>" + num + "</td>"));
                for (int col = 0; col < align.length; col++) {
                    nf = java.text.NumberFormat.getInstance();
                    parseStr = "";
                    numberExcep = false;
                    try {
                        if (contents[row][col].indexOf("%") == -1) {
                            parseStr = HtmlParseUtil.htmlParse(contents[row][col], -1);
                            numObj = nf.parse(parseStr);
                            numData = numObj.doubleValue();
                        }
                        else {
                            throw new Exception();
                        }
                    }
                    catch (Exception e) {
                        numData = -1;
                        numberExcep = true;
                    }
                    
                    numStr = "";
                    classStr = "class=xl36";
                    
                    if (!numberExcep && "right".equals(align[col])) {
                        // Digital format
                        intNum = 0;
                        realLength = 0;
                        
                        try {
                            intNum = parseStr.indexOf(".") + 1;
                            realLength = parseStr.length() - intNum;
                        }
                        catch (Exception e) {
                            System.err.println();
                        }
                        
                        if (realLength > 6)
                            realLength = 6;
                        
                        if (intNum > 1 && realLength > 0 && realLength < 7)
                            classStr = "class=xl4" + realLength;
                        else
                            classStr = "class=xl40";
                        
                        numStr = "x:num='" + numData + "'";
                    }
                    else if ("left".equals(align[col])) {
                        classStr = "class=xl26";
                        numStr = "";
                    }
                    else if ("center".equals(align[col])) {
                        classStr = "class=xl35";
                        numStr = "";
                    }
                    else {
                        classStr = "class=xl36";
                        numStr = "";
                    }
                    
                    dataOut.write(getUTFByteArry("<td " + classStr + " " + numStr + " >"
                            + contents[row][col] + "</td>"));
                    
                } // rof col
                dataOut.write(getUTFByteArry("</tr>"));
            } // rof row
        } // fi
        return;
    }
    
    /**
     * @param out
     * @throws IOException
     * @throws MCSException
     */
    public void outExcelSheet(Writer out)
            throws IOException {
        logger.debug(this.hashCode() + " outExcelSheet elapsed time:" + stopWatch.getElapsed()
                + "ms.");
        out.write(pageHeader);
        out.write(pageStyle);
        out.write(midStyle);
        out.write(afterStyle);
        out.write(makeInfoHeader());
        outWriterMainTable(out);
        out.write(makeBottom());
        out.flush();
        logger.debug("[END  EXCEL] = " + this.hashCode() + " total time:"
                + stopWatch.getTotalElapsed() + " ms.");
        return;
    }
    
    /**
     * @return
     * @throws IOException
     * @throws MCSException
     */
    public File makeFileSheet()
            throws IOException {
        
        //UUID uuid = new UUID();
        String dirName = System.getProperty("java.io.tmpdir");
        String filename = CodeGenerator.getUUID() + ".xls";
        
        logger.debug(this.hashCode() + " makeFileSheet elapsed time:" + stopWatch.getElapsed()
                + "ms.");
        java.io.File outFile = new java.io.File(dirName + "/" + filename);
        java.io.FileOutputStream toFile = new java.io.FileOutputStream(outFile);
        DataOutputStream dataOut = new DataOutputStream(toFile);
        
        dataOut.write(getUTFByteArry(pageHeader));
        dataOut.write(getUTFByteArry(pageStyle));
        dataOut.write(getUTFByteArry(midStyle));
        dataOut.write(getUTFByteArry(afterStyle));
        dataOut.write(getUTFByteArry(makeInfoHeader()));
        outStreamMainTable(dataOut);
        dataOut.write(getUTFByteArry(makeBottom()));
        dataOut.flush();
        dataOut.close();
        toFile.close();
        logger.debug("[END  EXCEL] = " + this.hashCode() + " total time:"
                + stopWatch.getTotalElapsed() + " ms.");
        return outFile;
    }
    
    private final static byte[] getUTFByteArry(String content)
            throws UnsupportedEncodingException {
        return content.getBytes("utf-8");
    }
    
    public String chkText(String src) {
        if (src.length() == 0)
            return src;
        
        if ("+".equals(src.substring(0, 1))) {
            return src.substring(1, src.length());
            
        }
        else {
            return src;
        }
    }
    
    public String getReportSign() {
        return reportSign;
    }
    
    public void setReportSign(String reportSign) {
        this.reportSign = reportSign;
    }
    
    public String getReportTitle() {
        return reportTitle;
    }
    
    public void setReportTitle(String reportTitle) {
        this.reportTitle = reportTitle;
    }
    
    public String getReportContents() {
        return reportContents;
    }
    
    public void setReportContents(String reportContents) {
        this.reportContents = reportContents;
    }
}

