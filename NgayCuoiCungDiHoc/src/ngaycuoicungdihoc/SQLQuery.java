/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngaycuoicungdihoc;


import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ASUS FX504
 */
public class SQLQuery {
    public Connect cn = new Connect();
    
    public ResultSet GetDSChucVu() throws SQLException{
        cn.connectSQL();
        String sql = "SELECT * FROM JobTitle";
        return cn.LoadData(sql);
    }
    
    public ResultSet getNhanVienFromMa(String id) throws SQLException {
        cn.connectSQL();
        String sql = "select a.EmployeeID, a.LastName+' '+a.FirstName as [name], a.Phone, c.JobTitles, a.PayGrade, b.ManagerName\n" +
                     "from Employee as a, Supervision as b, JobTitle as c\n" +
                     "where a.EmployeeID=b.EmployeeID and a.EmployeeID='" + id + "' and a.JobID=c.JobID";
        return cn.LoadData(sql);
    }
    
    public ResultSet getMaNhanVien(String id) throws SQLException {
        cn.connectSQL();
        String sql = "SELECT EmployeeID FROM Employee WHERE EmployeeID='"+id+"'";
        return cn.LoadData(sql);
    }
    
    public void RemoveNhanVien(String id) throws SQLException {
        cn.connectSQL();
        String sql = "DELETE FROM Supervision WHERE EmployeeID='"+id+"'";
        cn.UpdateData(sql);
        sql = "DELETE FROM Employee WHERE EmployeeID='"+id+"'";
        cn.UpdateData(sql);
    }
    
    public void AddNhanVien(String id, String fname, String lname, String phone, String jobName, String pay, String supName) throws SQLException {
        cn.connectSQL();
        String sql = "insert into Employee (EmployeeID,FirstName,LastName,JobID,Phone,PayGrade)\n" +
                     "values ('"+id+"', N'"+fname+"', N'"+lname+"', (select top 1 a.JobID from JobTitle as a where a.JobTitles=N'"+jobName+"'), '"+phone+"', "+pay+")";
        cn.UpdateData(sql);
        sql =   "insert into Supervision (EmployeeID,ManagerID,StartDate,ManagerName)\n" +
                "values ('"+id+"','LD001',05/05/2020, N'"+supName+"')";
        cn.UpdateData(sql);
    }
    
    public void UpdateNhanVien(String id, String fname, String lname, String phone, String jobName, String pay, String supName) throws SQLException {
        cn.connectSQL();
        String sql = "UPDATE Employee "
                +    "SET FirstName=N'"+fname+"', LastName=N'"+lname+"', Phone='"+phone+"',"
                +    " JobID=(select top 1 a.JobID from JobTitle as a where a.JobTitles=N'"+jobName+"'),PayGrade="+pay+" \n"
                +    "WHERE EmployeeID='"+id+"'";
        cn.UpdateData(sql);
        sql =   "update Supervision\n" +
                "set ManagerName=N'"+supName+"'\n" +
                "where EmployeeID='"+id+"'";
        cn.UpdateData(sql);
    }
    
    public ResultSet GetDSNV_ChucVu(String chucvu) throws SQLException{
        cn.connectSQL();
        String sql = "select b.EmployeeID, b.LastName+' '+b.FirstName  as [name], b.Phone, b.PayGrade\n" +
                     "from JobTitle as a, Employee as b\n" +
                     "where a.JobID=b.JobID and a.JobTitles=N'" + chucvu + "'";
        return cn.LoadData(sql);
    }
    
    public ResultSet GetNhanVien_ID(String id) throws SQLException {
        cn.connectSQL();
        String sql = "select a.EmployeeID, a.LastName + ' ' + a.FirstName as [name], a.Phone, a.PayGrade,b.ManagerName, c.JobTitles\n" +
                     "from Employee as a, Supervision as b, JobTitle as c\n" +
                     "where a.EmployeeID = '" + id + "' and a.EmployeeID = b.EmployeeID and a.JobID = c.JobID";
        return cn.LoadData(sql);
    }
}
