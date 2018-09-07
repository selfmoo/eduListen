unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,XLSReadWriteII4,SheetData4,SynBigTable,SynCommons,
  OBFileStore;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    StaticText3: TStaticText;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    ComboBoxTitle: TComboBox;
    ComboBoxAnswer: TComboBox;
    ComboBoxText: TComboBox;
    Button3: TButton;
    TabSheet3: TTabSheet;
    Button4: TButton;
    StaticText7: TStaticText;
    Edit4: TEdit;
    Edit5: TEdit;
    StaticText8: TStaticText;
    Edit6: TEdit;
    CheckBoxHasTitle: TCheckBox;
    TabSheet4: TTabSheet;
    Edit7: TEdit;
    Button5: TButton;
    GroupBox3: TGroupBox;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button6: TButton;
    Label4: TLabel;
    Edit11: TEdit;
    OBFileStore1: TOBFileStore;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function AddToDB(aName,aTitle,aText,aAnswer:string):boolean;
    procedure Button5Click(Sender: TObject);
  private
     XLS: TXLSReadWriteII4;
     FSheet:TSheet;
     AppPath:string;
     iBeginRow:Integer;
     iRowCount,iColumnCount:integer;
  public
    MaxColumn:integer;
  end;

var
  Form1: TForm1;

implementation
uses abcd;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  key:string;
begin
  key:=IntToStr(2017)+'abc'+IntToStr(ord('A'));
  Edit2.text:=StrToHex(des(key,Edit1.Text,1,0,''));
  //解密
  //ShowMessage(des(key,HexToStr(Edit2.Text),0,0,''));
end;

Function ExtractFileNameNoExt(FileString: String): String;
Var
  FileWithExtString: String;
  FileExtString: String;
  LenExt: Integer;
  LenNameWithExt: Integer;
Begin
  FileWithExtString := ExtractFileName(FileString);
  LenNameWithExt    := Length(FileWithExtString);  FileExtString     := ExtractFileExt(FileString);   LenExt            := Length(FileExtString);
  If LenExt = 0 Then 
     Begin
       Result := FileWithExtString;
     End
     Else
      Begin
       Result := Copy(FileWithExtString,1,(LenNameWithExt-LenExt)); 
      End;
 End;
 
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j:Integer;
  str:string;
begin
  Edit3.Text:='';
  if OpenDialog1.Execute then
  begin
    if Edit3.Text='' then
      Edit3.Text:=ExtractFileNameNoExt(OpenDialog1.FileName);
  end
  else
    exit;
  try
    XLS:= TXLSReadWriteII4.Create(nil);
    XLS.Filename:=OpenDialog1.FileName;
    xls.Read;
  except
    ShowMessage('excel 读取出错。');
    exit;
  end;
  FSheet := xls.Sheet[0];
  
  for i:=0 to 3 do
  begin
    str:=FSheet.AsString[0,i];
    if str<>'' then
    begin
      iBeginRow :=i;
      Break;
    end;
  end;
  ComboBoxTitle.Items.clear;
  ComboBoxAnswer.Items.clear;
  ComboBoxText.Items.clear;
  ComboBoxTitle.Text:='';
  ComboBoxAnswer.Text:='';
  ComboBoxText.Text:='';
  for i:=0 to MaxColumn-1 do
  begin
    str:=FSheet.AsString[i,iBeginRow];
    if str<>'' then
    begin
      ComboBoxTitle.Items.Add(str);
      ComboBoxAnswer.Items.Add(str);
      ComboBoxText.Items.Add(str);
    end;
  end;
  iRowCount :=FSheet.LastRow+1; //行
  iColumnCount:=FSheet.LastCol+1; //列
  
  //生成题库文件  *.tk 文件都加载到试题列表中

  //定义一个对象

  //搜索属于哪个科目的函数 function SearchLesson(aTitle:string):string;

  // 获取答案选项 GetAnswerAB
  // 获取答案内容 GetAnswerText
  //答案转化成选项 判断题 ，单选 ，多选
     // 判断题 是 A 对 ; 否 错 B 
  // 判断是否选项随机变换 FoundSelectChange
  //
  
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //
  MaxColumn:=7;
  AppPath:= ExtractFilePath(Application.ExeName);
end;

function FilterHz(s: string): string;
var

  P: ^Byte;
  Dest: string;
  Index: Integer;
begin
  Result := '';
  P := Pointer(@S[1]);
  Dest := '';
  Index := 1;
  while Index < Length(S) do
  begin
    if P^ >= 128 then //去除 0-127 字母与数据
    begin
      if P^ > 163 then // 是 汉字
      begin
        Dest := Dest + Chr(P^);
        Inc(Index);
        Inc(P);
        Dest := Dest + Chr(P^);
      end
      else
      begin
        Inc(Index);
        Inc(P);
      end;
    end;
    Inc(Index);
    Inc(P);
  end;
  Result := Dest;
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  i,j,id,iQuestionType,iTitleColumn,iValueColumn,iTextColumn:Integer;
  str,sQuestionTitle,sAnswerValue,sAnswerText:widestring;
  SaveFile:string;
  aTQAnswer,aTQText:TSynBigTableRecord;
  fAnswerValue, fQuestionID1,fQuestionID2, fAnswerText,fQuestionType,fQuestionTitle: TSynTableFieldProperties;
  aRecord,bRecord:TSynTableData;
  aList:TStringList;
  procedure AddAnswer();
  begin
    aRecord.SetFieldSBFValue(fQuestionID1,fQuestionID1.SBF(id));
    aRecord.SetFieldSBFValue(fQuestionType,fQuestionType.SBF(iQuestionType));
    aRecord.SetFieldSBFValue(fQuestionTitle,fQuestionTitle.SBF(WideStringToUTF8(sQuestionTitle)));
    //aRecord.Field['QuestionTitle'] :={BinToBase64}sQuestionTitle;//'abc'+inttostr(id);//
    //aRecord.SetFieldSBFValue(fQuestionTitle,fQuestionTitle.SBF(sQuestionTitle));
    aRecord.SetFieldSBFValue(fAnswerValue,fAnswerValue.SBF(sAnswerValue));
    aRecord.SetFieldSBFValue(fAnswerText,fAnswerText.SBF(WideStringToUTF8(sAnswerText)));
    aTQAnswer.RecordAdd(aRecord);
  end;
begin
  iTitleColumn:=ComboBoxTitle.ItemIndex;
  iValueColumn:=ComboBoxAnswer.ItemIndex;
  iTextColumn:= ComboBoxText.ItemIndex;
  if (iTitleColumn<0) or (iValueColumn<0) then
  begin
    ShowMessage('请选择匹配关系！');
    exit;
  end;
  //创建保存题库文件
  SaveFile:=AppPath+'\Lesson\';
  ForceDirectories(SaveFile);
  SaveFile:=SaveFile+Edit3.text+'.tmk';
  if FileExists(SaveFile) then
  begin
    aTQAnswer:= TSynBigTableRecord.Create(SaveFile,'QAnswer');
    id:=aTQAnswer.Count;
  end
  else
  begin
     id:=0;
    //==================建表
    aTQAnswer:= TSynBigTableRecord.Create(SaveFile,'QAnswer');
    aTQAnswer.AddField('QuestionID',tftInt32,[tfoIndex,tfoUnique]);
    aTQAnswer.AddField('QuestionType',tftInt32,[]);
    aTQAnswer.AddField('QuestionTitle',tftUTF8,[tfoIndex]);
    aTQAnswer.AddField('AnswerValue',tftWinAnsi,[]);
    aTQAnswer.AddField('AnswerText',tftUTF8,[]);
    aTQAnswer.AddFieldUpdate;
  end;
  fQuestionID1:=aTQAnswer.Table['QuestionID'];
  fQuestionType:=aTQAnswer.Table['QuestionType'];
  fQuestionTitle:=aTQAnswer.Table['QuestionTitle'];
  fAnswerValue:=aTQAnswer.Table['AnswerValue'];
  fAnswerText:=aTQAnswer.Table['AnswerText'];
  //==================建表
  try
    aRecord.Init(aTQAnswer.Table);
  //读取数据，保存到表中
  //EXCEL 数据格式 标题 答案 A文字 B文字 C文字 D文字 E文字
  if not CheckBoxHasTitle.Checked then
    iBeginRow:=-1;
  for j:=iBeginRow+1 to iRowCount-1 do
   begin
      str:=FSheet.AsString[iTitleColumn,j];
      if Length(str)<5 then Continue; //过滤空或字数太小的标题
      Inc(id);
      //StrToHanZiList(str,aList);
      sQuestionTitle:=FilterHz(str);
      str:=trim(FSheet.AsString[iValueColumn,j]);
      if Trim(str)='' then Continue;
      sAnswerValue:=str;
      sAnswerText:='';
      if iTextColumn>=1 then //判断题没有具体选项内容
      begin  //若选项有多个，A B C D E ?
        for i:=0 to MaxColumn-(iTextColumn+1) do
        begin
          //if i>=iValueColumn-1 then break;
          str:=FSheet.AsString[iTextColumn+i,j];
          if trim(str)='' then Continue;
          str:=StringReplace(str,'#','',[rfReplaceAll]);
          sAnswerText:=sAnswerText+str+'#';
        end;
      end;
      iQuestionType:=1;//单选或判断
      if Length(sAnswerValue)>=2 then iQuestionType:=2;
      AddAnswer;
   end;
   //aTQAnswer.Pack(true);
   aTQAnswer.UpdateToFile();
   ShowMessage('生成成功！');
  finally
    aTQAnswer.Free;
    aTQText.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  aTQAnswer,aTQText:TSynBigTableRecord;
  i,j,sum:Integer;
  aRecord,bRecord:TSynTableData;
  str,sQuestionTitle,sAnswerValue,sAnswerText:string;
  fAnswerValue, fQuestionID1,fQuestionID2, fAnswerText,fQuestionType,fQuestionTitle: TSynTableFieldProperties;
begin
 //
 aTQAnswer:= TSynBigTableRecord.Create(AppPath+'lesson\'+Edit6.text+'.tmk','QAnswer');
 try
   sum:=aTQAnswer.count;
   fQuestionID1:=aTQAnswer.Table['QuestionID'];
   fQuestionType:=aTQAnswer.Table['QuestionType'];
   fQuestionTitle:=aTQAnswer.Table['QuestionTitle'];
   fAnswerValue:=aTQAnswer.Table['AnswerValue'];
   fAnswerText:=aTQAnswer.Table['AnswerText'];
   for i:=1 to sum do
   begin
     aTQAnswer.RecordGet(i,aRecord);
     j:=integer(aRecord.GetFieldSBFValue(fQuestionID1));
     sQuestionTitle:=aRecord.GetFieldValue(fQuestionTitle);//Base64ToBin(RawUTF8(aRecord.GetFieldValue(fQuestionTitle)));

     if Pos(FilterHz(Edit4.text),sQuestionTitle)>0 then
     begin
       sAnswerValue:=aRecord.GetFieldValue(fAnswerValue); //RawUTF8
       str:=aRecord.GetFieldValue(fAnswerText); //RawUTF8
       Edit5.text:=sAnswerValue+':'+str;
       Break;
     end;
   end;
 finally
    aTQAnswer.Free
 end;
end;

function TForm1.AddToDB(aName, aTitle, aText, aAnswer: string): boolean;
begin
  result:=false;
  {SaveFile:=AppPath+'\Lesson\';
  ForceDirectories(SaveFile);
  SaveFile:=SaveFile+aName+'.tmk';
  if FileExists(SaveFile) then
  begin
    aTQAnswer:= TSynBigTableRecord.Create(SaveFile,'QAnswer');
    id:=aTQAnswer.Count;
  end
  else
  begin
     id:=0;
    //==================建表
    aTQAnswer:= TSynBigTableRecord.Create(SaveFile,'QAnswer');
    aTQAnswer.AddField('QuestionID',tftInt32,[tfoIndex,tfoUnique]);
    aTQAnswer.AddField('QuestionType',tftInt32,[]);
    aTQAnswer.AddField('QuestionTitle',tftUTF8,[tfoIndex]);
    aTQAnswer.AddField('AnswerValue',tftWinAnsi,[]);
    aTQAnswer.AddField('AnswerText',tftWinAnsi,[]);
    aTQAnswer.AddFieldUpdate;
  end;
  fQuestionID1:=aTQAnswer.Table['QuestionID'];
  fQuestionType:=aTQAnswer.Table['QuestionType'];
  fQuestionTitle:=aTQAnswer.Table['QuestionTitle'];
  fAnswerValue:=aTQAnswer.Table['AnswerValue'];
  fAnswerText:= aTQAnswer.Table['AnswerText'];}
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  //
end;

end.
