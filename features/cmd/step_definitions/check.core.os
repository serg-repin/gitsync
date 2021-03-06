﻿#Использовать "../../../src/core/"

// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯСоздаюНовыйМенеджерподписок");
	ВсеШаги.Добавить("ЯСоздаюНовыйИнтерфейсплагинов");
	ВсеШаги.Добавить("МенеджераподписокРеализуетИнтерфейсаплагинов");
	ВсеШаги.Добавить("ЯСоздаюНовыйТестовыйплагин");
	ВсеШаги.Добавить("ТестовыйплагинРеализуетИнтерфейсаплагинов");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры

//Я создаю новый МенеджерПодписок
Процедура ЯСоздаюНовыйМенеджерподписок() Экспорт

	МенеджерПодписок = Новый МенеджерПодписок(Новый Соответствие);
	БДД.СохранитьВКонтекст("МенеджераПодписок", МенеджерПодписок);

КонецПроцедуры

//Я создаю новый ИнтерфейсПлагинов
Процедура ЯСоздаюНовыйИнтерфейсплагинов() Экспорт

	ИнтерфейсПлагинов = Новый ИнтерфейсПлагинов;
	БДД.СохранитьВКонтекст("ИнтерфейсПлагинов", ИнтерфейсПлагинов);

КонецПроцедуры

//МенеджераПодписок реализует ИнтерфейсаПлагинов
Процедура МенеджераподписокРеализуетИнтерфейсаплагинов() Экспорт

	МенеджераПодписок = БДД.ПолучитьИзКонтекста("МенеджераПодписок");
	ИнтерфейсПлагинов = БДД.ПолучитьИзКонтекста("ИнтерфейсПлагинов");
	
	ИнтерфейсПлагинов.Реализует(МенеджераПодписок, Истина);

КонецПроцедуры

//Я создаю новый ТестовыйПлагин
Процедура ЯСоздаюНовыйТестовыйплагин() Экспорт
	ПутьКПлагину = ОбъединитьПути(ТекущийСценарий().Каталог, "testsata/test_plugin/src/Классы", "testPlugin.os");
	ПодключитьСценарий(ПутьКПлагину, "ТестовыйПлагин");

	БДД.СохранитьВКонтекст("ТестовыйПлагин", Новый ТестовыйПлагин);
КонецПроцедуры

//ТестовыйПлагин реализует ИнтерфейсаПлагинов
Процедура ТестовыйплагинРеализуетИнтерфейсаплагинов() Экспорт
	ИнтерфейсПлагинов = БДД.ПолучитьИзКонтекста("ИнтерфейсПлагинов");
	ТестовыйПлагин = БДД.ПолучитьИзКонтекста("ТестовыйПлагин");
	
	ИнтерфейсПлагинов.Реализует(ТестовыйПлагин, Истина);
КонецПроцедуры
