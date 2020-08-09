#Область ОписанияЭлементов

Функция НовыйОписаниеРеквизитаЭлемента() Экспорт
	СтруктураРеквизита = Новый Структура;

	СтруктураРеквизита.Вставить("СоздаватьРеквизит", Истина);
	СтруктураРеквизита.Вставить("Имя", "");
	СтруктураРеквизита.Вставить("ОписаниеТипов", Новый ОписаниеТипов("Строка", , , , Новый КвалификаторыСтроки(10)));
	СтруктураРеквизита.Вставить("ПутьКДанным", "");
	СтруктураРеквизита.Вставить("Заголовок", "");

	СтруктураРеквизита.Вставить("СоздаватьЭлемент", Истина);
	СтруктураРеквизита.Вставить("РодительЭлемента", Неопределено);
	СтруктураРеквизита.Вставить("ПередЭлементом", Неопределено);
	СтруктураРеквизита.Вставить("МногострочныйРежим", Неопределено);
	СтруктураРеквизита.Вставить("РасширенноеРедактирование", Неопределено);
	СтруктураРеквизита.Вставить("РастягиватьПоГоризонтали", Неопределено);
	СтруктураРеквизита.Вставить("РастягиватьПоВертикали", Неопределено);

	СтруктураРеквизита.Вставить("Параметры", НовыйПараметрыРеквизита());

	СтруктураРеквизита.Вставить("Действия", Новый Структура);

	Возврат СтруктураРеквизита;

КонецФункции

Функция НовыйПараметрыРеквизита()

	Параметры = Новый Структура;

	Параметры.Вставить("Тип", Тип("ПолеФормы"));
	Параметры.Вставить("Вид_ПоУмолчанию", ВидПоляФормы.ПолеВвода);

	Возврат Параметры;

КонецФункции

Функция НовыйОписаниеКомандыКнопки() Экспорт
	Структура = Новый Структура;

	Структура.Вставить("СоздаватьКоманду", Истина);
	Структура.Вставить("СоздаватьКнопку", Истина);

	Структура.Вставить("Имя", "");
	Структура.Вставить("Действие", "");
	Структура.Вставить("ИмяКоманды", "");
	Структура.Вставить("ЭтоГиперссылка", Ложь);
	Структура.Вставить("РодительЭлемента", Неопределено);
	Структура.Вставить("ПередЭлементом", Неопределено);
	Структура.Вставить("Заголовок", "");
	Структура.Вставить("Подсказка", "");
	Структура.Вставить("СочетаниеКлавиш", Неопределено);
	Структура.Вставить("Картинка", Неопределено);

	Возврат Структура;
КонецФункции

Функция НовыйОписаниеГруппыФормы() Экспорт
	Параметры = Новый Структура;

	Параметры.Вставить("Вид", ВидГруппыФормы.ОбычнаяГруппа);
	Параметры.Вставить("Имя", "");
	Параметры.Вставить("Заголовок", "");
	Параметры.Вставить("Поведение", ПоведениеОбычнойГруппы.Обычное);
	Параметры.Вставить("Отображение", ОтображениеОбычнойГруппы.Нет);
	Параметры.Вставить("Группировка", ГруппировкаПодчиненныхЭлементовФормы.Вертикальная);
	Параметры.Вставить("ОтображатьЗаголовок", Ложь);
	Параметры.Вставить("Родитель", Неопределено);

	Возврат Параметры;

КонецФункции

#КонецОбласти

#Область ПрограммноеСозданиеЭлементов

Функция СоздатьКомандуПоОписанию(Форма, ОписаниеКоманды) Экспорт
	Если Не ОписаниеКоманды.СоздаватьКоманду Тогда
		Возврат Неопределено;
	КонецЕсли;
	Команда = Форма.Команды.Добавить(ОписаниеКоманды.Имя);
	Команда.Заголовок = ОписаниеКоманды.Заголовок;
	Команда.Подсказка = ОписаниеКоманды.Подсказка;
	Команда.Действие = ОписаниеКоманды.Действие;
	Команда.Картинка = ОписаниеКоманды.Картинка;
	Если ОписаниеКоманды.СочетаниеКлавиш <> Неопределено Тогда
		Команда.СочетаниеКлавиш = ОписаниеКоманды.СочетаниеКлавиш;
	КонецЕсли;

	Возврат Команда;
КонецФункции

Функция СоздатьЭлементПоОписанию(Форма, ОписаниеРеквизита) Экспорт
	Если Не ОписаниеРеквизита.СоздаватьЭлемент Тогда
		Возврат Неопределено;
	КонецЕсли;

	ИмяЭлементаФормы = ИмяТаблицыПоляФормы(Форма, ОписаниеРеквизита.РодительЭлемента) + ОписаниеРеквизита.Имя;
	ЭлементФормы = Форма.Элементы.Найти(ИмяЭлементаФормы);
	Если ЭлементФормы <> Неопределено Тогда
		Возврат ЭлементФормы;
	КонецЕсли;

	Если ОписаниеРеквизита.ПередЭлементом = Неопределено Тогда
		ЭлементФормы = Форма.Элементы.Добавить(ИмяТаблицыПоляФормы(Форма, ОписаниеРеквизита.РодительЭлемента)
			+ ОписаниеРеквизита.Имя, ОписаниеРеквизита.Параметры.Тип, ЭлементФормы(Форма,
			ОписаниеРеквизита.РодительЭлемента));
	Иначе
		ЭлементФормы = Форма.Элементы.Вставить(ИмяТаблицыПоляФормы(Форма, ОписаниеРеквизита.РодительЭлемента)
			+ ОписаниеРеквизита.Имя, ОписаниеРеквизита.Параметры.Тип, ЭлементФормы(Форма,
			ОписаниеРеквизита.РодительЭлемента), ЭлементФормы(Форма, ОписаниеРеквизита.ПередЭлементом));
	КонецЕсли;

	ЭлементФормы.Заголовок = ОписаниеРеквизита.Заголовок;

	Если Тип(ЭлементФормы) = Тип("ПолеФормы") Тогда
		ЭлементФормы.Вид = ОписаниеРеквизита.Параметры.Вид_ПоУмолчанию;
		Попытка
			Если ТипЗнч(Реквизит(Форма, ОписаниеРеквизита.Имя, ОписаниеРеквизита.ПутьКРеквизиту)) = Тип("Булево") Тогда
				ЭлементФормы.Вид = ВидПоляФормы.ПолеФлажка;
			КонецЕсли;
		Исключение
		//			ОписаниеОшибки = ОписаниеОшибки();
		КонецПопытки;
	КонецЕсли;

	ЗаполнитьЗначенияСвойств(ЭлементФормы, ОписаниеРеквизита.Параметры);

	Если Тип(ЭлементФормы) = Тип("ПолеФормы") Тогда
		Если ЗначениеЗаполнено(ОписаниеРеквизита.ПутьКДанным) Тогда
			ЭлементФормы.ПутьКДанным = ОписаниеРеквизита.ПутьКДанным;
		Иначе
			ЭлементФормы.ПутьКДанным = ОписаниеРеквизита.Имя;
		КонецЕсли;

		Если ОписаниеРеквизита.МногострочныйРежим <> Неопределено Тогда
			ЭлементФормы.МногострочныйРежим = ОписаниеРеквизита.МногострочныйРежим;
		КонецЕсли;
		Если ОписаниеРеквизита.РасширенноеРедактирование <> Неопределено Тогда
			ЭлементФормы.РасширенноеРедактирование = ОписаниеРеквизита.РасширенноеРедактирование;
		КонецЕсли;

	КонецЕсли;
	Если ОписаниеРеквизита.РастягиватьПоГоризонтали <> Неопределено Тогда
		ЭлементФормы.РастягиватьПоГоризонтали = ОписаниеРеквизита.РастягиватьПоГоризонтали;
	КонецЕсли;
	Если ОписаниеРеквизита.РастягиватьПоВертикали <> Неопределено Тогда
		ЭлементФормы.РастягиватьПоВертикали = ОписаниеРеквизита.РастягиватьПоВертикали;
	КонецЕсли;

	Для Каждого Действие Из ОписаниеРеквизита.Действия Цикл
		ЭлементФормы.УстановитьДействие(Действие.Ключ, Действие.Значение);
	КонецЦикла;
	Возврат ЭлементФормы;
КонецФункции

Функция СоздатьКнопкуПоОписанию(Форма, ОписаниеКнопки) Экспорт
	Если Не ОписаниеКнопки.СоздаватьКнопку Тогда
		Возврат Неопределено;
	КонецЕсли;

	Кнопка = Форма.Элементы.Вставить(ОписаниеКнопки.Имя, Тип("КнопкаФормы"), ЭлементФормы(Форма,
		ОписаниеКнопки.РодительЭлемента), ЭлементФормы(Форма, ОписаниеКнопки.ПередЭлементом));
	Если Не ОписаниеКнопки.СоздаватьКоманду Тогда
		Кнопка.Заголовок = ОписаниеКнопки.Заголовок;
	КонецЕсли;
	Если ОписаниеКнопки.ЭтоГиперссылка = Ложь Тогда
		Если ЭтоКнопкаКоманднойПанели(Форма, ОписаниеКнопки.РодительЭлемента) Тогда
			Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
		Иначе
			Кнопка.Вид = ВидКнопкиФормы.КнопкаКоманднойПанели;
		КонецЕсли;
	Иначе
		Если ЭтоКнопкаКоманднойПанели(Форма, ОписаниеКнопки.РодительЭлемента) Тогда
			Кнопка.Вид = ВидКнопкиФормы.Гиперссылка;
		Иначе
			Кнопка.Вид = ВидКнопкиФормы.ГиперссылкаКоманднойПанели;
		КонецЕсли;
	КонецЕсли;
	Кнопка.ИмяКоманды = ОписаниеКнопки.ИмяКоманды;

КонецФункции

Функция СоздатьГруппуПоОписанию(Форма, Описание) Экспорт

	ИмяЭлементаФормы = ИмяТаблицыПоляФормы(Форма, Описание.Родитель) + Описание.Имя;
	ГруппаФормы = Форма.Элементы.Найти(ИмяЭлементаФормы);
	Если ГруппаФормы <> Неопределено Тогда
		Возврат ГруппаФормы;
	КонецЕсли;
	ГруппаФормы = Форма.Элементы.Добавить(ИмяЭлементаФормы, Тип("ГруппаФормы"), ЭлементФормы(Форма, Описание.Родитель));

	ГруппаФормы.Вид = Описание.Вид;

	ГруппаФормы.Заголовок = Описание.Заголовок;

	ЗаполнитьЗначенияСвойств(ГруппаФормы, Описание, "Группировка,ОтображатьЗаголовок");

	Если ГруппаФормы.вид = ВидГруппыФормы.ОбычнаяГруппа Тогда
		ЗаполнитьЗначенияСвойств(ГруппаФормы, Описание, "Поведение,Отображение");
	КонецЕсли;
	Возврат ГруппаФормы;
КонецФункции

Функция ЭтоКнопкаКоманднойПанели(Форма, Знач РодительКнопки)
//@skip-warning
	Если РодительКнопки = Неопределено Тогда
		Возврат Ложь;
	ИначеЕсли РодительКнопки = Форма.КоманднаяПанель Тогда
		Возврат Истина;
	ИначеЕсли ТипЗнч(РодительКнопки) = Тип("УправляемаяФорма") Тогда
		Возврат Ложь;
	Иначе
		РодительКнопки = ЭлементФормы(Форма, РодительКнопки);
		Возврат ЭтоКнопкаКоманднойПанели(Форма, РодительКнопки.Родитель);
	КонецЕсли;
КонецФункции

//@skip-warning
Функция ИмяТаблицыПоляФормы(Форма, Знач РодительЭлемента)
//@skip-warning
	Если РодительЭлемента = Неопределено Тогда
		Возврат "";
	ИначеЕсли ТипЗнч(РодительЭлемента) = Тип("ТаблицаФормы") Тогда
		Возврат РодительЭлемента.Имя;
	ИначеЕсли ТипЗнч(РодительЭлемента) = Тип("УправляемаяФорма") Тогда
		Возврат "";
	Иначе
	//		РодительКнопки = ЭлементФормы(Форма, РодительЭлемента);
		Возврат ИмяТаблицыПоляФормы(Форма, РодительЭлемента.Родитель);
	КонецЕсли;
КонецФункции

Функция ЭлементФормы(Форма, Идентификатор) Экспорт
	Если ТипЗнч(Идентификатор) = Тип("Строка") Тогда
		Возврат Форма.Элементы.Найти(Идентификатор);
	Иначе
		Возврат Идентификатор;
	КонецЕсли;
КонецФункции

Функция Реквизит(Форма, ИмяРеквизита, ПутьКРеквизиту = "") Экспорт
	Если ПутьКРеквизиту <> "" Тогда
		Разделитель = СтрНайти(ПутьКРеквизиту, ".");
		Если Разделитель = 0 Тогда
			ИмяШага = ПутьКРеквизиту;
			ОстатокПути = "";
		Иначе
			ИмяШага = Лев(ПутьКРеквизиту, Разделитель - 1);
			ОстатокПути = Сред(ПутьКРеквизиту, Разделитель + 1);
		КонецЕсли;
		Возврат Реквизит(Форма[ИмяШага], ИмяРеквизита, ОстатокПути);
	Иначе
		НесуществующееЗначение = Неопределено;
		Структура = Новый Структура(ИмяРеквизита, НесуществующееЗначение);
		ЗаполнитьЗначенияСвойств(Структура, Форма);
		Если Структура[ИмяРеквизита] = НесуществующееЗначение Тогда
			Возврат НесуществующееЗначение;
		КонецЕсли;
		Возврат Форма[ИмяРеквизита];
	КонецЕсли;
КонецФункции

#КонецОбласти

#Область ПараметрыЗаписи

Процедура ФормаПриСозданииНаСервереСоздатьРеквизитыПараметровЗаписи(Форма, ГруппаФормы) Экспорт
	ПараметрыЗаписи=Новый Структура;
	ПараметрыЗаписи.Вставить("БезАвторегистрацииИзменений", Новый Структура("Значение,Заголовок", Ложь,
		"Без авторегистрации изменений"));
	ПараметрыЗаписи.Вставить("ЗаписьВРежимеЗагрузки", Новый Структура("Значение,Заголовок", Ложь,
		"Запись в режиме загрузки(Без проверок)"));
	ПараметрыЗаписи.Вставить("ПривелигированныйРежим", Новый Структура("Значение,Заголовок", Ложь,
		"Привелигированный режим"));
	ПараметрыЗаписи.Вставить("ИспользоватьДопСвойства", Новый Структура("Значение,Заголовок", Ложь,
		"Использовать доп. свойства"));
	ПараметрыЗаписи.Вставить("ДополнительныеСвойства", Новый Структура("Значение,Заголовок", Новый Структура,
		"Дополнительные свойства"));
	ПараметрыЗаписи.Вставить("ИспользоватьПроцедуруПередЗаписью", Новый Структура("Значение,Заголовок", Ложь,
		"Без авторегистрации изменений"));
	ПараметрыЗаписи.Вставить("ПроцедураПередЗаписью", Новый Структура("Значение,Заголовок", "",
		"Без авторегистрации изменений"));

	ПрефиксПараметра="ПараметрЗаписи_";

	МассивДобавляемыхРеквизитов=Новый Массив;

	Для Каждого КлючЗначение Из ПараметрыЗаписи Цикл
		ТипРеквизита=ТипЗнч(КлючЗначение.Значение.Значение);

		Если ТипРеквизита = Тип("Структура") Тогда
			ТипРеквизита=Тип("ТаблицаЗначений");
//			Продолжить;
		КонецЕсли;

		МассивТипов=Новый Массив;
		МассивТипов.Добавить(ТипРеквизита);
		НовыйРеквизит=Новый РеквизитФормы(ПрефиксПараметра + КлючЗначение.Ключ, Новый ОписаниеТипов(МассивТипов), "",
			КлючЗначение.Значение.Заголовок, Ложь);
		МассивДобавляемыхРеквизитов.Добавить(НовыйРеквизит);
	КонецЦикла;

	Форма.ИзменитьРеквизиты(МассивДобавляемыхРеквизитов);

	МассивДобавляемыхРеквизитов.Очистить();
	МассивДобавляемыхРеквизитов.Добавить(Новый РеквизитФормы("Ключ", Новый ОписаниеТипов("Строка"), ПрефиксПараметра
		+ "ДополнительныеСвойства", "Ключ", Ложь));

	МассивТиповЗначения=Новый Массив;
	МассивТиповЗначения.Добавить("Булево");
	МассивТиповЗначения.Добавить("Строка");
	МассивТиповЗначения.Добавить("Число");
	МассивТиповЗначения.Добавить("Дата");
	МассивТиповЗначения.Добавить("УникальныйИдентификатор");
	МассивТиповЗначения.Добавить("ЛюбаяСсылка");
	МассивДобавляемыхРеквизитов.Добавить(Новый РеквизитФормы("Значение", Новый ОписаниеТипов(МассивТиповЗначения),
		ПрефиксПараметра + "ДополнительныеСвойства", "Значение", Ложь));
	Форма.ИзменитьРеквизиты(МассивДобавляемыхРеквизитов);

	МассивДляСозданияЭлементов=УИ_ОбщегоНазначенияКлиентСервер.ПараметрыЗаписиДляВыводаНаФормуИнструмента();

	Для Каждого ИмяСоздаваемогоЭлемента Из МассивДляСозданияЭлементов Цикл
		ОписаниеЭлемента=НовыйОписаниеРеквизитаЭлемента();
		ОписаниеЭлемента.СоздаватьЭлемент = Истина;
		ОписаниеЭлемента.Имя=ПрефиксПараметра + ИмяСоздаваемогоЭлемента;
		ОписаниеЭлемента.РодительЭлемента = ГруппаФормы;
		ОписаниеЭлемента.Параметры.Вставить("Вид", ВидПоляФормы.ПолеФлажка);

		УИ_РаботаСФормами.СоздатьЭлементПоОписанию(Форма, ОписаниеЭлемента);
	КонецЦикла;
	
	//Добавляем кнопку редактирования настроек
	ОписаниеКнопки=НовыйОписаниеКомандыКнопки();
	ОписаниеКнопки.Имя=ПрефиксПараметра + "РедактироватьПараметрыЗаписи";
	ОписаниеКнопки.ИмяКоманды=ОписаниеКнопки.Имя;
	ОписаниеКнопки.РодительЭлемента=ГруппаФормы;
	ОписаниеКнопки.Заголовок="Другие параметры записи";
	ОписаниеКнопки.Картинка=БиблиотекаКартинок.ПараметрыВыводаКомпоновкиДанных;
	ОписаниеКнопки.ЭтоГиперссылка=Истина;
	ОписаниеКнопки.Действие="Подключаемый_НастроитьПараметрыЗаписи";

	УИ_РаботаСФормами.СоздатьКомандуПоОписанию(Форма, ОписаниеКнопки);
	УИ_РаботаСФормами.СоздатьКнопкуПоОписанию(Форма, ОписаниеКнопки);
КонецПроцедуры

#КонецОбласти