﻿///Copyright (c) 2021, https://github.com/Larii75.
///
///Разрешается повторное распространение и использование как в виде исходного кода, так и в двоичной форме, с изменениями или без, при соблюдении следующих условий:
///
///При повторном распространении исходного кода должно оставаться указанное выше уведомление об авторском праве, этот список условий и последующий отказ от гарантий.
///При повторном распространении двоичного кода должна сохраняться указанная выше информация об авторском праве, этот список условий и последующий отказ от гарантий 
///в документации и/или в других материалах, поставляемых при распространении. 
///Ни название <Организации>, ни имена её сотрудников не могут быть использованы в качестве поддержки или продвижения продуктов, основанных на этом ПО без предварительного письменного разрешения.
///ЭТА ПРОГРАММА ПРЕДОСТАВЛЕНА ВЛАДЕЛЬЦАМИ АВТОРСКИХ ПРАВ И/ИЛИ ДРУГИМИ СТОРОНАМИ «КАК ОНА ЕСТЬ» БЕЗ КАКОГО-ЛИБО ВИДА ГАРАНТИЙ, ВЫРАЖЕННЫХ ЯВНО ИЛИ ПОДРАЗУМЕВАЕМЫХ, ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ ИМИ, 
///ПОДРАЗУМЕВАЕМЫЕ ГАРАНТИИ КОММЕРЧЕСКОЙ ЦЕННОСТИ И ПРИГОДНОСТИ ДЛЯ КОНКРЕТНОЙ ЦЕЛИ. 
///НИ В КОЕМ СЛУЧАЕ НИ ОДИН ВЛАДЕЛЕЦ АВТОРСКИХ ПРАВ И НИ ОДНО ДРУГОЕ ЛИЦО, КОТОРОЕ МОЖЕТ ИЗМЕНЯТЬ И/ИЛИ ПОВТОРНО РАСПРОСТРАНЯТЬ ПРОГРАММУ, КАК БЫЛО СКАЗАНО ВЫШЕ, НЕ НЕСЁТ ОТВЕТСТВЕННОСТИ,
///ВКЛЮЧАЯ ЛЮБЫЕ ОБЩИЕ, СЛУЧАЙНЫЕ, СПЕЦИАЛЬНЫЕ ИЛИ ПОСЛЕДОВАВШИЕ УБЫТКИ, ВСЛЕДСТВИЕ ИСПОЛЬЗОВАНИЯ ИЛИ НЕВОЗМОЖНОСТИ ИСПОЛЬЗОВАНИЯ ПРОГРАММЫ 
///(ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ ПОТЕРЕЙ ДАННЫХ, ИЛИ ДАННЫМИ, СТАВШИМИ НЕПРАВИЛЬНЫМИ, ИЛИ ПОТЕРЯМИ, ПРИНЕСЕННЫМИ ИЗ-ЗА ВАС ИЛИ ТРЕТЬИХ ЛИЦ, 
///ИЛИ ОТКАЗОМ ПРОГРАММЫ РАБОТАТЬ СОВМЕСТНО С ДРУГИМИ ПРОГРАММАМИ), ДАЖЕ ЕСЛИ ТАКОЙ ВЛАДЕЛЕЦ ИЛИ ДРУГОЕ ЛИЦО БЫЛИ ИЗВЕЩЕНЫ О ВОЗМОЖНОСТИ ТАКИХ УБЫТКОВ.
///
///Copyright (c) 2021, https://github.com/Larii75 All rights reserved.
///
///Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
///
///Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
///Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
///Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
///THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
///THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER 
///OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
///PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
///LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
///EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура Загрузить(Команда)
	
	#Если ВебКлиент Тогда 
	ДополнительныеПараметры = Новый Структура;
    ДополнительныеПараметры.Вставить("ВыборЗавершение", Новый ОписаниеОповещения("ВложенияВыборЗавершение", ЭтотОбъект, ДополнительныеПараметры));
    Оповещение = Новый ОписаниеОповещения("НачатьПодключениеРасширенияРаботыСФайламиЗавершение", ЭтотОбъект, ДополнительныеПараметры);
    НачатьПодключениеРасширенияРаботыСФайлами(Оповещение);	
	#Иначе
	ПоказатьДиалог();
	#КонецЕсли
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура НачатьПодключениеРасширенияРаботыСФайламиЗавершение(Подключено, ДополнительныеПараметры) Экспорт
	
	Если НЕ Подключено Тогда
        Оповещение = Новый ОписаниеОповещения("НачатьУстановкуРасширенияРаботыСФайламиЗавершение", ЭтотОбъект, ДополнительныеПараметры);
        ТекстСообщения = НСтр("ru='Для продолжении работы необходимо установить расширение для веб-клиента ""1С:Предприятие"". Установить?'");
        ПоказатьВопрос(Оповещение, ТекстСообщения, РежимДиалогаВопрос.ДаНет); 
    Иначе
        ВыполнитьОбработкуОповещения(ДополнительныеПараметры.ВыборЗавершение);
	КонецЕсли;
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура НачатьУстановкуРасширенияРаботыСФайламиЗавершение(Результат, ДополнительныеПараметры) Экспорт
	
	Если Результат = КодВозвратаДиалога.Да Тогда
        НачатьУстановкуРасширенияРаботыСФайлами(ДополнительныеПараметры.ВыборЗавершение);
	КонецЕсли;
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ВложенияВыборЗавершение(ДополнительныеПараметры) Экспорт
	
	ПоказатьДиалог();
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ПослеВыбораФайла(ОписаниеПомещенногоФайла, ДополнительныеПараметры) Экспорт
	
	Запись.ИмяФайла = ОписаниеПомещенногоФайла.СсылкаНаФайл.Имя;
	Запись.Расширение = ОписаниеПомещенногоФайла.СсылкаНаФайл.Расширение;
	
	Модифицированность = Истина;
	
	ИзображениеАдрес = ОписаниеПомещенногоФайла.Адрес;

КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ВыборФайлаЗавершение(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт

	Если НЕ ВыбранныеФайлы = Неопределено Тогда
		ОписаниеОповещенияОЗавершении = Новый ОписаниеОповещения("ПослеВыбораФайла", ЭтотОбъект);
		НачатьПомещениеФайлаНаСервер(ОписаниеОповещенияОЗавершении, , , , ВыбранныеФайлы[0], УникальныйИдентификатор);
	КонецЕсли;
	
КонецПроцедуры // ВыборФайлаЗавершение()

// <Описание процедуры>
//
//
&НаКлиенте
Процедура ПоказатьДиалог()

	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Фильтр = НСтр("ru='Файлы изображений (*.jpg, *.jpeg, *.png)|*.[jJ][pP][gG];*.[jJ][pP][eE][gG];*.[pP][nN][gG]|'");
	Диалог.Заголовок = НСтр("ru='Выберите файл изображения'");
	Диалог.МножественныйВыбор = Ложь;
	ОповещениеЗавершения = Новый ОписаниеОповещения("ВыборФайлаЗавершение", ЭтотОбъект);
	Диалог.Показать(ОповещениеЗавершения);

КонецПроцедуры // ПоказатьДиалог()

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	Если НЕ ПустаяСтрока(ИзображениеАдрес) Тогда
		ТекущийОбъект.ДвоичныеДанные = Новый ХранилищеЗначения(ПолучитьИзВременногоХранилища(ИзображениеАдрес), Новый СжатиеДанных(9));
	Иначе
		Отказ = Истина;
	КонецЕсли;
	ТекущийОбъект.Пользователь = ПараметрыСеанса.ТекущийПользователь;
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ИзображениеАдрес = РегистрыСведений.БезопасноеХранилищеДанных.ВернутьАдресВременногоХранилищаДД(Запись.ИсходныйКлючЗаписи);
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	
	Если ПустаяСтрока(ИзображениеАдрес) Тогда
		Отказ = Истина;
		ПоказатьПредупреждение(, "Нет данных для содержимого файла!", , "Ошибка!");
	КонецЕсли;
	
КонецПроцедуры

// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	// Вставить содержимое обработчика.
КонецПроцедуры
