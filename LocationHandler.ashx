<%@ WebHandler Language="VB" Class="LocationHandler" %>

Imports System
Imports System.Web
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization


Public Class LocationHandler : Implements IHttpHandler

    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim term As String = context.Request("term") & ""
        Dim ListLocationNames As List(Of String) = New List(Of String)
        Dim cs As String = "Data Source=.\SQLEXPRESS;Initial Catalog=DARTHDB;Integrated Security=True;Pooling=False"
        Dim con As SqlConnection = New SqlConnection(cs)
        Dim cmd As SqlCommand = New SqlCommand("spGetLocationNamesCity", con)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@term", term)
        con.Open()
        Dim rdr As SqlDataReader = cmd.ExecuteReader()
        While (rdr.Read())
            ListLocationNames.Add(rdr("Name").ToString())

        End While

        Dim js As JavaScriptSerializer = New JavaScriptSerializer()
        context.Response.Write(js.Serialize(ListLocationNames))
    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class