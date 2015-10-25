__author__ = 'liangjx'
# -*- coding: utf-8 -*-
import xdrlib, sys
import xlrd
import os

lua_out_path = "lua_config"
define_out_path = "Common"
excel_dir_path = "excel"
excel_to_lua_data = "ExcelToLuaData.lua"

#打开表
def open_excel(file = 'file.xls'):
    try:
        data = xlrd.open_workbook(file)
        return data
    except Exception as e:
        print(str(e))

#取出表中某一行的数据
def excel_table_byindex(file = 'file.xls', colnameindex = 0, by_index = 0):
    data = open_excel(file)
    table = data.sheets()[by_index]
    nrows = table.nrows
    colnames = table.row_values(colnameindex)
    data_type = table.row_values(colnameindex+1)
    list = []
    for rownum in range(2, nrows):
        row = table.row_values(rownum)
        if row:
            app = {}
            for i in  range(len(colnames)):
                if data_type[i] == "int":
                    app[colnames[i]] = int(row[i])
                elif data_type[i] == "float":
                    app[colnames[i]] = float(row[i])
                elif data_type[i] == "string":
                    app[colnames[i]] = "\""+row[i]+"\""
                elif data_type[i] == "bool":
                    if row[i] == "true":
                        app[colnames[i]] = "true"
                    else:
                        app[colnames[i]] = "false"
                else:
                    app[colnames[i]] = row[i]

            tt = parse_excel_to_lua(app,colnames)
            if row != table.row_values(-1):
                tt += ","
            list.append(tt)

    return list

def parse_excel_to_lua(data, colnames):
    app = "[%s]="%(data['id'])
    app += "{"
    for i in range(len(colnames)):
        app += colnames[i]
        app += "="
        app += str(data[colnames[i]])
        if colnames[i] != colnames[-1]:
            app += ","
    app += "}"
    return  app

def excel_table_byname(file = 'file.xls', colnameindex = 0, by_name = u'Sheet1'):
    data = open_excel(file)
    table = data.sheet_by_name(by_name)
    nrows = table.nrows
    ncols = table.ncols
    colnames = table.row_values(colnameindex)
    list = []
    for rownum in range(1, nrows):
        row = table.row_values(rownum)
        if row:
            app = {}
            for i in  range(len(colnames)):
                app[colnames[i]] = row[i]
            list.append(app)
    return list

#保存成lua文件
def save_lua(data, filename):
    if not os.path.exists(lua_out_path):
        os.mkdir(lua_out_path)
    save_path = lua_out_path +"/"+filename+".lua"
    file_object = open(save_path, 'wt')
    lua_table_name = filename[0].upper() + filename[1:]
    file_object.write("local %s = {}\n"%(filename))
    file_object.write("\n")
    file_object.write("local ConfigData = {\n")
    for row in data:
        file_object.write("\t%s\n"%(row))
    file_object.write("}\n")
    file_object.write("\n")
    file_object.write("function %s.GetConfig(id)\n\treturn ConfigData[id]\nend"%(filename))
    file_object.write("\n")
    file_object.write("\n")
    file_object.write("function %s.GetAllConfig()\n\treturn ConfigData.value\nend"%(filename))
    file_object.write("\n")
    file_object.write("\n")
    file_object.write("return %s"%(filename))
    file_object.close()

#保存lua引用文件
def save_define(file_list):
    if not os.path.exists(define_out_path):
        os.mkdir(define_out_path)
    save_path = define_out_path +"/" + excel_to_lua_data
    file_object = open(save_path, 'wt')
    for filename in file_list:
        file_object.write("%s = require \"%s/%s\"\n"%(filename, lua_out_path, filename))

    file_object.write("\n")
    file_object.write("ExcelToLuaData = {\n")
    for filename in file_list:
        if filename == file_list[-1]:
            file_object.write("\t[\"%s\"] = %s\n"%(filename, filename))
        else:
            file_object.write("\t[\"%s\"] = %s,\n"%(filename, filename))
    file_object.write("}\n")
    file_object.write("\n")
    file_object.close()

def main():
    files = os.listdir(excel_dir_path)
    file_name = []
    for name in files:
        path = excel_dir_path + "/" +name
        tables = excel_table_byindex(path, 0, 0)
        exts = name.split(".")
        save_lua(tables, exts[0])
        file_name.append(exts[0])
    save_define(file_name)

if __name__ == '__main__':
    main()
