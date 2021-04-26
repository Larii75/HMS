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

#Если Сервер ИЛИ ВнешнееСоединение Тогда
	
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Ответственный = ПараметрыСеанса.ТекущийПользователь;

КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Бронирование") Тогда
		СредствоРазмещения = ДанныеЗаполнения.СредствоРазмещения;
		Бронирование = ДанныеЗаполнения.Ссылка;
		ЭтажСредстваРазмещения = ДанныеЗаполнения.ЭтажРазмещения;
		Для Каждого ТекСтрокаМестаРазмещения Из ДанныеЗаполнения.МестаРазмещения Цикл
			НоваяСтрока = ГостиПоМестам.Добавить();
			НоваяСтрока.Комната = ТекСтрокаМестаРазмещения.КомнатаСредстваРазмещения;
			НоваяСтрока.Место = ТекСтрокаМестаРазмещения.МестоРазмещения;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)

	Движения.ОстаткиЗаселенияПоБронированиям.Записывать = Истина;
	Движения.ОстаткиЗаселенияПоБронированиям.Очистить();
 	Движения.ОстаткиЗаселенияПоБронированиям.Записать();
	
	Движения.ОстаткиВыселенийПоЗаселениям.Записывать = Истина;
	Движения.ОстаткиВыселенийПоЗаселениям.Очистить();
 	Движения.ОстаткиВыселенийПоЗаселениям.Записать();
	
	Движения.ОстаткиБронирования.Записывать = Истина;
	Движения.ОстаткиБронирования.Очистить();
 	Движения.ОстаткиБронирования.Записать();
	
	Движения.ОборотыЗаселения.Записывать = Истина;
	Движения.ОборотыЗаселения.Очистить();
 	Движения.ОборотыЗаселения.Записать();
		
	Движения.ОстаткиЗаселенияПоБронированиям.БлокироватьДляИзменения = Истина;
	Движения.ОстаткиВыселенийПоЗаселениям.БлокироватьДляИзменения = Истина;
	Движения.ОстаткиБронирования.БлокироватьДляИзменения = Истина;
	Движения.ОборотыЗаселения.БлокироватьДляИзменения = Истина;
	
	Движения.ОстаткиЗаселенияПоБронированиям.Записывать = Истина;
	Движения.ОстаткиВыселенийПоЗаселениям.Записывать = Истина;
	Движения.ОборотыЗаселения.Записывать = Истина;
	
	Для Каждого ТекСтрокаГостиПоМестам Из ГостиПоМестам Цикл
		// регистр ОстаткиЗаселенияПоБронированиям Расход
		Движение = Движения.ОстаткиЗаселенияПоБронированиям.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Бронирование = Бронирование;
		Движение.СредствоРазмещения = СредствоРазмещения;
		Движение.ЭтажСредстваРазмещения = ЭтажСредстваРазмещения;
		Движение.КомнатаСредстваРазмещения = ТекСтрокаГостиПоМестам.Комната;
		Движение.МестоРазмещения = ТекСтрокаГостиПоМестам.Место;
		Движение.Количество = 1;
		Движение.Гость = ТекСтрокаГостиПоМестам.Гость;
		
		// регистр ОстаткиВыселенийПоЗаселениям Приход
		Движение2 = Движения.ОстаткиВыселенийПоЗаселениям.Добавить();
		Движение2.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение2.Период = Дата;
		Движение2.Бронирование = Бронирование;
		Движение2.Заселение = Ссылка;
		Движение2.СредствоРазмещения = СредствоРазмещения;
		Движение2.ЭтажСредстваРазмещения = ЭтажСредстваРазмещения;
		Движение2.КомнатаСредстваРазмещения = ТекСтрокаГостиПоМестам.Комната;
		Движение2.МестоРазмещения = ТекСтрокаГостиПоМестам.Место;
		Движение2.Гость = ТекСтрокаГостиПоМестам.Гость;
		Движение2.Количество = 1;
		
		// регистр ОстаткиБронирования Расход
		Движение3 = Движения.ОстаткиБронирования.Добавить();
		Движение3.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение3.Период = Дата;
		Движение3.МояОрганизация = Бронирование.МояОрганизация;
		Движение3.Событие = Бронирование.Событие;
		Движение3.Бронирующий = Бронирование.Бронирующий;
		Движение3.Бронирование = Бронирование;
		Движение3.СредствоРазмещения = СредствоРазмещения;
		Движение3.ЭтажСредстваРазмещения = ЭтажСредстваРазмещения;
		Движение3.КомнатаСредстваРазмещения = ТекСтрокаГостиПоМестам.Комната;
		Движение3.МестоРазмещения = ТекСтрокаГостиПоМестам.Место;
		Движение3.Количество = 1;

		// регистр ОборотыЗаселения
		Движение4 = Движения.ОборотыЗаселения.Добавить();
		Движение4.Период = Дата;
		Движение4.Бронирование = Бронирование;
		Движение4.СредствоРазмещения = СредствоРазмещения;
		Движение4.ЭтажСредстваРазмещения = ЭтажСредстваРазмещения;
		Движение4.КомнатаСредстваРазмещения = ТекСтрокаГостиПоМестам.Комната;
		Движение4.МестоРазмещения = ТекСтрокаГостиПоМестам.Место;
		Движение4.Гость = ТекСтрокаГостиПоМестам.Гость;
		Движение4.Количество = 1;
				
	КонецЦикла;

КонецПроцедуры

#Иначе

ВызватьИсключение("Недопустимый вызов объекта на клиенте!");

#КонецЕсли