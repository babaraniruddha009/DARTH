<%@ WebHandler Language="VB" Class="BlodMapHandler" %>

Imports System
Imports System.Web
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Public Class BlodMapHandler : Implements IHttpHandler

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
        If term.ToUpper = "O" Or term.ToUpper = "O+" Or term.ToUpper = "O-" Then
            ListLocationNames.Add("O+")
            ListLocationNames.Add("O-")
        End If
        If term.ToUpper = "A" Or term.ToUpper = "A+" Or term.ToUpper = "A-" Then
            ListLocationNames.Add("A+")
            ListLocationNames.Add("A-")
        End If
        If term.ToUpper = "B" Or term.ToUpper = "B+" Or term.ToUpper = "B-" Then
            ListLocationNames.Add("B+")
            ListLocationNames.Add("B-")
        End If

        If term.ToUpper = "AB" Or term.ToUpper = "AB+" Or term.ToUpper = "AB-" Then
            ListLocationNames.Add("AB+")
            ListLocationNames.Add("AB-")
        End If
        If term.ToUpper = "B" Or term = "Bombay+" Or term = "Bombay-" Or term = "Bo" Or term = "Bom" Then
            ListLocationNames.Add("Bombay+")
            ListLocationNames.Add("Bombay-")
        End If


        Dim js As JavaScriptSerializer = New JavaScriptSerializer()
        context.Response.Write(js.Serialize(ListLocationNames))
    End Sub

    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class