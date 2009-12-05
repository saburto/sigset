<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdenesPorTecnico.aspx.cs" Inherits="Web.Reportes.OrdenesPorTecnico" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" 
            Font-Names="Verdana" Font-Size="8pt" Height="400px"
            ShowBackButton="false" ShowCredentialPrompts="False" 
            ShowDocumentMapButton="False" ShowFindControls="False" 
            ShowPageNavigationControls="False" ShowParameterPrompts="False" ShowPromptAreaButton="False"
            >
            <LocalReport ReportPath="Reportes\OrdenesTecnicos.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                        Name="OrdenesTecnicos_OrdenesSegunTecnico" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="Web.DateSetInformes.OrdenesTecnicosTableAdapters.OrdenesSegunTecnicoTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="" QueryStringField="tipoEstado" Name="tipoEstado" Type="Int32" />
                <asp:QueryStringParameter DefaultValue="" Name="fechaInicio" 
                    QueryStringField="fechaInicio" Type="DateTime" />
                <asp:QueryStringParameter DefaultValue="" Name="fechaFin" 
                    QueryStringField="fechaFin" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    </div>
    </form>
</body>
</html>
