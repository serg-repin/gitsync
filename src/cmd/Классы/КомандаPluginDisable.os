#Использовать "../../core"

Процедура ОписаниеКоманды(Команда) Экспорт
	
	Команда.Опция("a all", Ложь, "Отключить все включенные плагины")
					.ВОкружении("GITSYNC_DISABLE_ALL_PLUGINS");
	Команда.Аргумент("PLUGIN", "", "Имя плагина")
					.ТМассивСтрок()
					.ВОкружении("GITSYNC_PLUGINS");
	
	Команда.Спек = "(-a | --all) | PLUGIN...";

КонецПроцедуры

Процедура ВыполнитьКоманду(Знач Команда) Экспорт

	ИменаПлагинов = Команда.ЗначениеАргумента("PLUGIN");
	ВсеВключенные = Команда.ЗначениеОпции("all");

	МенеджерПлагинов = ПараметрыПриложения.МенеджерПлагинов();
	
	Лог = ПараметрыПриложения.Лог();
	Лог.Отладка("Отключение всех плагинов <%1>", ВсеВключенные);

	Если ВсеВключенные Тогда
		МенеджерПлагинов.ОтключитьВсеПлагины();
	Иначе
		МенеджерПлагинов.ОтключитьПлагины(ИменаПлагинов);
	КонецЕсли;
	
	ПараметрыПриложения.ЗаписатьВключенныеПлагины();

КонецПроцедуры
