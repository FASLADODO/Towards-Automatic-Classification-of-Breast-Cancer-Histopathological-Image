function Export_To_Excel(Myfilename,Mytable)

%Create a sample table of column-oriented data and display the first five rows.
%load patients.mat
%T = table(LastName,Age,Weight,Smoker);
%T(1:5,:)
%varNames = who;
%Your variables are:
%Mypath     TrainType  Xte        Yte        choice     traindir   

Mytable = magic(5)
Myfilename = 'patientdata.xlsx';
xlswrite(Myfilename,Mytable)
%ans = 
%     LastName     Age    Weight    Smoker
%   __________    ___    ______    ______
%    'Smith'       38     176       true  
%    'Johnson'     43     163       false 
%    'Williams'    38     131       false 
%    'Jones'       40     133       false 
%    'Brown'       49     119       false 
%Write table T to the first sheet in a new spreadsheet file named patientdata.xlsx, starting at cell D1. Specify the portion of the worksheet to write to, using the Range name-value pair argument.
%filename = 'patientdata.xlsx';
%writetable(T,filename,'Sheet',1,'Range','D1')
%By default, writetable writes the table variable names as column headings in the spreadsheet file.
%Write table T to the second sheet in the file, but do not write the table variable names.
%writetable(T,filename,'Sheet',2,'WriteVariableNames',false)
%Write Numeric and Text Data to Spreadsheet File
%This example shows how to export a numeric array and a cell array to a Microsoft Excel spreadsheet file, using the xlswrite function. You can export data in individual numeric and text workspace variables to any worksheet in the file, and to any location within that worksheet. By default, xlswrite writes your matrix data to the first worksheet in the file, starting at cell A1.
%Create a sample array of numeric data, A, and a sample cell array of text and numeric data, C.
%A = magic(5)
%C = {'Time', 'Temp'; 12 98; 13 'x'; 14 97}
%A =
%    17    24     1     8    15
%    23     5     7    14    16
%     4     6    13    20    22
%    10    12    19    21     3
%    11    18    25     2     9
%C = 
%    'Time'    'Temp'
%    [  12]    [  98]
%    [  13]    'x'   
%    [  14]    [  97]
%Write array A to the 5-by-5 rectangular region, E1:I5, on the first sheet in a new spreadsheet file named testdata.xlsx.
%filename = 'testdata.xlsx';
%xlswrite(filename,A,1,'E1:I5')
%xlswrite(filename,C,'Temperatures','B2');
%xlswrite displays a warning because the worksheet, Temperatures, does not already exist in the file.
%warning('off','MATLAB:xlswrite:AddSheet')
%See Also
%writetable | xlswrite

end

