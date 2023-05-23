--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-05-23 22:20:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 214 (class 1259 OID 24846)
-- Name: ad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ad_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ad_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 24847)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name_of_the_city character varying(255)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24850)
-- Name: cities_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24851)
-- Name: city_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24852)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24855)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 220 (class 1259 OID 24856)
-- Name: trip_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trip_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trip_seq OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25004)
-- Name: trip_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip_user (
    user_id integer NOT NULL,
    trip_id integer NOT NULL
);


ALTER TABLE public.trip_user OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25007)
-- Name: trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trips (
    id integer NOT NULL,
    departure_date_and_time date NOT NULL,
    from_town character varying(30),
    to_town character varying(30),
    user_id integer
);


ALTER TABLE public.trips OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24863)
-- Name: trips_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trips_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24864)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id integer NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24867)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24872)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3199 (class 2604 OID 24873)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 24874)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3359 (class 0 OID 24847)
-- Dependencies: 215
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, name_of_the_city) FROM stdin;
1	Абаза
3	Абакан
4	Абдулино
5	Абинск
6	Агидель
7	Агрыз
8	Адыгейск
9	Азнакаево
10	Азов
11	Ак-Довурак
12	Аксай
13	Алагир
14	Алапаевск
15	Алатырь
16	Алдан
17	Алейск
18	Александров
19	Александровск
20	Александровск-Сахалинский
21	Алексеевка
22	Алексин
23	Алзамай
24	Алупка
25	Алушта
26	Альметьевск
27	Амурск
28	Анадырь
29	Анапа
30	Ангарск
31	Андреаполь
32	Анжеро-Судженск
33	Анива
34	Апатиты
35	Апрелевка
36	Апшеронск
37	Арамиль
38	Аргун
39	Ардатов
40	Ардон
41	Арзамас
42	Аркадак
43	Армавир
44	Армянск
45	Арсеньев
46	Арск
47	Артём
48	Артёмовск
49	Артёмовский
50	Архангельск
51	Асбест
52	Асино
53	Астрахань
54	Аткарск
55	Ахтубинск
56	Ачинск
57	Аша
58	Бабаево
59	Бабушкин
60	Бавлы
61	Багратионовск
62	Байкальск
63	Баймак
64	Бакал
65	Баксан
66	Балабаново
67	Балаково
68	Балахна
69	Балашиха
70	Балашов
71	Балей
72	Балтийск
73	Барабинск
74	Барнаул
75	Барыш
76	Батайск
77	Бахчисарай
78	Бежецк
79	Белая Калитва
80	Белая Холуница
81	Белгород
82	Белебей
83	Белёв
84	Белинский
85	Белово
86	Белогорск
88	Белозерск
89	Белокуриха
90	Беломорск
91	Белоозёрский
92	Белорецк
93	Белореченск
94	Белоусово
95	Белоярский
96	Белый
97	Бердск
98	Березники
99	Берёзовский
101	Беслан
102	Бийск
103	Бикин
104	Билибино
105	Биробиджан
106	Бирск
107	Бирюсинск
108	Бирюч
109	Благовещенск
111	Благодарный
112	Бобров
113	Богданович
114	Богородицк
115	Богородск
116	Боготол
117	Богучар
118	Бодайбо
119	Бокситогорск
120	Болгар
121	Бологое
122	Болотное
123	Болохово
124	Болхов
125	Большой Камень
126	Бор
127	Борзя
128	Борисоглебск
129	Боровичи
130	Боровск
131	Бородино
132	Братск
133	Бронницы
134	Брянск
135	Бугульма
136	Бугуруслан
137	Будённовск
138	Бузулук
139	Буинск
140	Буй
141	Буйнакск
142	Бутурлиновка
143	Валдай
144	Валуйки
145	Велиж
146	Великие Луки
147	Великий Новгород
148	Великий Устюг
149	Вельск
150	Венёв
151	Верещагино
152	Верея
153	Верхнеуральск
154	Верхний Тагил
155	Верхний Уфалей
156	Верхняя Пышма
157	Верхняя Салда
158	Верхняя Тура
159	Верхотурье
160	Верхоянск
161	Весьегонск
162	Ветлуга
163	Видное
164	Вилюйск
165	Вилючинск
166	Вихоревка
167	Вичуга
168	Владивосток
169	Владикавказ
170	Владимир
171	Волгоград
172	Волгодонск
173	Волгореченск
174	Волжск
175	Волжский
176	Вологда
177	Володарск
178	Волоколамск
179	Волосово
180	Волхов
181	Волчанск
182	Вольск
183	Воркута
184	Воронеж
185	Ворсма
186	Воскресенск
187	Воткинск
188	Всеволожск
189	Вуктыл
190	Выборг
191	Выкса
192	Высоковск
193	Высоцк
194	Вытегра
195	Вышний Волочёк
196	Вяземский
197	Вязники
198	Вязьма
199	Вятские Поляны
200	Гаврилов Посад
201	Гаврилов-Ям
202	Гагарин
203	Гаджиево
204	Гай
205	Галич
206	Гатчина
207	Гвардейск
208	Гдов
209	Геленджик
210	Георгиевск
211	Глазов
212	Голицыно
213	Горбатов
214	Горно-Алтайск
215	Горнозаводск
216	Горняк
217	Городец
218	Городище
219	Городовиковск
220	Гороховец
221	Горячий Ключ
222	Грайворон
223	Гремячинск
224	Грозный
225	Грязи
226	Грязовец
227	Губаха
228	Губкин
229	Губкинский
230	Гудермес
231	Гуково
232	Гулькевичи
233	Гурьевск
235	Гусев
236	Гусиноозёрск
237	Гусь-Хрустальный
238	Давлеканово
239	Дагестанские Огни
240	Далматово
241	Дальнегорск
242	Дальнереченск
243	Данилов
244	Данков
245	Дегтярск
246	Дедовск
247	Демидов
248	Дербент
249	Десногорск
250	Джанкой
251	Дзержинск
252	Дзержинский
253	Дивногорск
254	Дигора
255	Димитровград
256	Дмитриев
257	Дмитров
258	Дмитровск
259	Дно
260	Добрянка
261	Долгопрудный
262	Долинск
263	Домодедово
264	Донецк
265	Донской
266	Дорогобуж
267	Дрезна
268	Дубна
269	Дубовка
270	Дудинка
271	Духовщина
272	Дюртюли
273	Дятьково
274	Евпатория
275	Егорьевск
276	Ейск
277	Екатеринбург
278	Елабуга
279	Елец
280	Елизово
281	Ельня
282	Еманжелинск
283	Емва
284	Енисейск
285	Ермолино
286	Ершов
287	Ессентуки
288	Ефремов
289	Железноводск
290	Железногорск
292	Железногорск-Илимский
293	Жердевка
294	Жигулёвск
295	Жиздра
296	Жирновск
297	Жуков
298	Жуковка
299	Жуковский
300	Завитинск
301	Заводоуковск
302	Заволжск
303	Заволжье
304	Задонск
305	Заинск
306	Закаменск
307	Заозёрный
308	Заозёрск
309	Западная Двина
310	Заполярный
311	Зарайск
312	Заречный
314	Заринск
315	Звенигово
316	Звенигород
317	Зверево
318	Зеленогорск
319	Зеленоградск
320	Зеленодольск
321	Зеленокумск
322	Зерноград
323	Зея
324	Зима
325	Златоуст
326	Злынка
327	Змеиногорск
328	Знаменск
329	Зубцов
330	Зуевка
331	Ивангород
332	Иваново
333	Ивантеевка
334	Ивдель
335	Игарка
336	Ижевск
337	Избербаш
338	Изобильный
339	Иланский
340	Инза
341	Иннополис
342	Инсар
343	Инта
344	Ипатово
345	Ирбит
346	Иркутск
347	Исилькуль
348	Искитим
349	Истра
350	Ишим
351	Ишимбай
352	Йошкар-Ола
353	Кадников
354	Казань
355	Калач
356	Калач-на-Дону
357	Калачинск
358	Калининград
359	Калининск
360	Калтан
361	Калуга
362	Калязин
363	Камбарка
364	Каменка
365	Каменногорск
366	Каменск-Уральский
367	Каменск-Шахтинский
368	Камень-на-Оби
369	Камешково
370	Камызяк
371	Камышин
372	Камышлов
373	Канаш
374	Кандалакша
375	Канск
376	Карабаново
377	Карабаш
378	Карабулак
379	Карасук
380	Карачаевск
381	Карачев
382	Каргат
383	Каргополь
384	Карпинск
385	Карталы
386	Касимов
387	Касли
388	Каспийск
389	Катав-Ивановск
390	Катайск
391	Качканар
392	Кашин
393	Кашира
394	Кедровый
395	Кемерово
396	Кемь
397	Керчь
398	Кизел
399	Кизилюрт
400	Кизляр
401	Кимовск
402	Кимры
403	Кингисепп
404	Кинель
405	Кинешма
406	Киреевск
407	Киренск
408	Киржач
409	Кириллов
410	Кириши
411	Киров
413	Кировград
414	Кирово-Чепецк
415	Кировск
417	Кирс
418	Кирсанов
419	Киселёвск
420	Кисловодск
421	Клин
422	Клинцы
423	Княгинино
424	Ковдор
425	Ковров
426	Ковылкино
427	Когалым
428	Кодинск
429	Козельск
430	Козловка
431	Козьмодемьянск
432	Кола
433	Кологрив
434	Коломна
435	Колпашево
436	Кольчугино
437	Коммунар
438	Комсомольск
439	Комсомольск-на-Амуре
440	Конаково
441	Кондопога
442	Кондрово
443	Константиновск
444	Копейск
445	Кораблино
446	Кореновск
447	Коркино
448	Королёв
449	Короча
450	Корсаков
451	Коряжма
452	Костерёво
453	Костомукша
454	Кострома
455	Котельники
456	Котельниково
457	Котельнич
458	Котлас
459	Котово
460	Котовск
461	Кохма
462	Красавино
463	Красноармейск
465	Красновишерск
466	Красногорск
467	Краснодар
468	Краснозаводск
469	Краснознаменск
471	Краснокаменск
472	Краснокамск
473	Красноперекопск
474	Краснослободск
476	Краснотурьинск
477	Красноуральск
478	Красноуфимск
479	Красноярск
480	Красный Кут
481	Красный Сулин
482	Красный Холм
483	Кремёнки
484	Кропоткин
485	Крымск
486	Кстово
487	Кубинка
488	Кувандык
489	Кувшиново
490	Кудрово
491	Кудымкар
492	Кузнецк
493	Куйбышев
494	Кукмор
495	Кулебаки
496	Кумертау
497	Кунгур
498	Купино
499	Курган
500	Курганинск
501	Курильск
502	Курлово
503	Куровское
504	Курск
505	Куртамыш
506	Курчалой
507	Курчатов
508	Куса
509	Кушва
510	Кызыл
511	Кыштым
512	Кяхта
513	Лабинск
514	Лабытнанги
515	Лагань
516	Ладушкин
517	Лаишево
518	Лакинск
519	Лангепас
520	Лахденпохья
521	Лебедянь
522	Лениногорск
523	Ленинск
524	Ленинск-Кузнецкий
525	Ленск
526	Лермонтов
527	Лесной
528	Лесозаводск
529	Лесосибирск
530	Ливны
531	Ликино-Дулёво
532	Липецк
533	Липки
534	Лиски
535	Лихославль
536	Лобня
537	Лодейное Поле
538	Лосино-Петровский
539	Луга
540	Луза
541	Лукоянов
542	Луховицы
543	Лысково
544	Лысьва
545	Лыткарино
546	Льгов
547	Любань
548	Люберцы
549	Любим
550	Людиново
551	Лянтор
552	Магадан
553	Магас
554	Магнитогорск
555	Майкоп
556	Майский
557	Макаров
558	Макарьев
559	Макушино
560	Малая Вишера
561	Малгобек
562	Малмыж
563	Малоархангельск
564	Малоярославец
565	Мамадыш
566	Мамоново
567	Мантурово
568	Мариинск
569	Мариинский Посад
570	Маркс
571	Махачкала
572	Мглин
573	Мегион
574	Медвежьегорск
575	Медногорск
576	Медынь
577	Межгорье
578	Междуреченск
579	Мезень
580	Меленки
581	Мелеуз
582	Менделеевск
583	Мензелинск
584	Мещовск
585	Миасс
586	Микунь
587	Миллерово
588	Минеральные Воды
589	Минусинск
590	Миньяр
591	Мирный
593	Михайлов
594	Михайловка
595	Михайловск
597	Мичуринск
598	Могоча
599	Можайск
600	Можга
601	Моздок
602	Мончегорск
603	Морозовск
604	Моршанск
605	Мосальск
606	Москва
607	Муравленко
608	Мураши
609	Мурино
610	Мурманск
611	Муром
612	Мценск
613	Мыски
614	Мытищи
615	Мышкин
616	Набережные Челны
617	Навашино
618	Наволоки
619	Надым
620	Назарово
621	Назрань
622	Называевск
623	Нальчик
624	Нариманов
625	Наро-Фоминск
626	Нарткала
627	Нарьян-Мар
628	Находка
629	Невель
630	Невельск
631	Невинномысск
632	Невьянск
633	Нелидово
634	Неман
635	Нерехта
636	Нерчинск
637	Нерюнгри
638	Нестеров
639	Нефтегорск
640	Нефтекамск
641	Нефтекумск
642	Нефтеюганск
643	Нея
644	Нижневартовск
645	Нижнекамск
646	Нижнеудинск
647	Нижние Серги
648	Нижний Ломов
649	Нижний Новгород
650	Нижний Тагил
651	Нижняя Салда
652	Нижняя Тура
653	Николаевск
654	Николаевск-на-Амуре
655	Никольск
657	Никольское
658	Новая Ладога
659	Новая Ляля
660	Новоалександровск
661	Новоалтайск
662	Новоаннинский
663	Нововоронеж
664	Новодвинск
665	Новозыбков
666	Новокубанск
667	Новокузнецк
668	Новокуйбышевск
669	Новомичуринск
670	Новомосковск
671	Новопавловск
672	Новоржев
673	Новороссийск
674	Новосибирск
675	Новосиль
676	Новосокольники
677	Новотроицк
678	Новоузенск
679	Новоульяновск
680	Новоуральск
681	Новохопёрск
682	Новочебоксарск
683	Новочеркасск
684	Новошахтинск
685	Новый Оскол
686	Новый Уренгой
687	Ногинск
688	Нолинск
689	Норильск
690	Ноябрьск
691	Нурлат
692	Нытва
693	Нюрба
694	Нягань
695	Нязепетровск
696	Няндома
697	Облучье
698	Обнинск
699	Обоянь
700	Обь
701	Одинцово
702	Озёрск
704	Озёры
705	Октябрьск
706	Октябрьский
707	Окуловка
708	Олёкминск
709	Оленегорск
710	Олонец
711	Омск
712	Омутнинск
713	Онега
714	Опочка
715	Орёл
716	Оренбург
717	Орехово-Зуево
718	Орлов
719	Орск
720	Оса
721	Осинники
722	Осташков
723	Остров
724	Островной
725	Острогожск
726	Отрадное
727	Отрадный
728	Оха
729	Оханск
730	Очёр
731	Павлово
732	Павловск
733	Павловский Посад
734	Палласовка
735	Партизанск
736	Певек
737	Пенза
738	Первомайск
739	Первоуральск
740	Перевоз
741	Пересвет
742	Переславль-Залесский
743	Пермь
744	Пестово
745	Петров Вал
746	Петровск
747	Петровск-Забайкальский
748	Петрозаводск
749	Петропавловск-Камчатский
750	Петухово
751	Петушки
752	Печора
753	Печоры
754	Пикалёво
755	Пионерский
756	Питкяранта
757	Плавск
758	Пласт
759	Плёс
760	Поворино
761	Подольск
762	Подпорожье
763	Покачи
764	Покров
765	Покровск
766	Полевской
767	Полесск
768	Полысаево
769	Полярные Зори
770	Полярный
771	Поронайск
772	Порхов
773	Похвистнево
774	Почеп
775	Починок
776	Пошехонье
777	Правдинск
778	Приволжск
779	Приморск
781	Приморско-Ахтарск
782	Приозерск
783	Прокопьевск
784	Пролетарск
785	Протвино
786	Прохладный
787	Псков
788	Пугачёв
789	Пудож
790	Пустошка
791	Пучеж
792	Пушкино
793	Пущино
794	Пыталово
795	Пыть-Ях
796	Пятигорск
797	Радужный
799	Райчихинск
800	Раменское
801	Рассказово
802	Ревда
803	Реж
804	Реутов
805	Ржев
806	Родники
807	Рославль
808	Россошь
809	Ростов
810	Ростов-на-Дону
811	Рошаль
812	Ртищево
813	Рубцовск
814	Рудня
815	Руза
816	Рузаевка
817	Рыбинск
818	Рыбное
819	Рыльск
820	Ряжск
821	Рязань
822	Саки
823	Салават
824	Салаир
825	Салехард
826	Сальск
827	Самара
828	Санкт-Петербург
829	Саранск
830	Сарапул
831	Саратов
832	Саров
833	Сасово
834	Сатка
835	Сафоново
836	Саяногорск
837	Саянск
838	Светлогорск
839	Светлоград
840	Светлый
841	Светогорск
842	Свирск
843	Свободный
844	Себеж
845	Севастополь
846	Северо-Курильск
847	Северобайкальск
848	Северодвинск
849	Североморск
850	Североуральск
851	Северск
852	Севск
853	Сегежа
854	Сельцо
855	Семёнов
856	Семикаракорск
857	Семилуки
858	Сенгилей
859	Серафимович
860	Сергач
861	Сергиев Посад
862	Сердобск
863	Серов
864	Серпухов
865	Сертолово
866	Сибай
867	Сим
868	Симферополь
869	Сковородино
870	Скопин
871	Славгород
872	Славск
873	Славянск-на-Кубани
874	Сланцы
875	Слободской
876	Слюдянка
877	Смоленск
878	Снежинск
879	Снежногорск
880	Собинка
881	Советск
884	Советская Гавань
885	Советский
886	Сокол
887	Солигалич
888	Соликамск
889	Солнечногорск
890	Соль-Илецк
891	Сольвычегодск
892	Сольцы
893	Сорочинск
894	Сорск
895	Сортавала
896	Сосенский
897	Сосновка
898	Сосновоборск
899	Сосновый Бор
900	Сосногорск
901	Сочи
902	Спас-Деменск
903	Спас-Клепики
904	Спасск
905	Спасск-Дальний
906	Спасск-Рязанский
907	Среднеколымск
908	Среднеуральск
909	Сретенск
910	Ставрополь
911	Старая Купавна
912	Старая Русса
913	Старица
914	Стародуб
915	Старый Крым
916	Старый Оскол
917	Стерлитамак
918	Стрежевой
919	Строитель
920	Струнино
921	Ступино
922	Суворов
923	Судак
924	Суджа
925	Судогда
926	Суздаль
927	Сунжа
928	Суоярви
929	Сураж
930	Сургут
931	Суровикино
932	Сурск
933	Сусуман
934	Сухиничи
935	Сухой Лог
936	Сызрань
937	Сыктывкар
938	Сысерть
939	Сычёвка
940	Сясьстрой
941	Тавда
942	Таганрог
943	Тайга
944	Тайшет
945	Талдом
946	Талица
947	Тамбов
948	Тара
949	Тарко-Сале
950	Таруса
951	Татарск
952	Таштагол
953	Тверь
954	Теберда
955	Тейково
956	Темников
957	Темрюк
958	Терек
959	Тетюши
960	Тимашёвск
961	Тихвин
962	Тихорецк
963	Тобольск
964	Тогучин
965	Тольятти
966	Томари
967	Томмот
968	Томск
969	Топки
970	Торжок
971	Торопец
972	Тосно
973	Тотьма
974	Трёхгорный
975	Троицк
976	Трубчевск
977	Туапсе
978	Туймазы
979	Тула
980	Тулун
981	Туран
982	Туринск
983	Тутаев
984	Тында
985	Тырныауз
986	Тюкалинск
987	Тюмень
988	Уварово
989	Углегорск
990	Углич
991	Удачный
992	Удомля
993	Ужур
994	Узловая
995	Улан-Удэ
996	Ульяновск
997	Унеча
998	Урай
999	Урень
1000	Уржум
1001	Урус-Мартан
1002	Урюпинск
1003	Усинск
1004	Усмань
1005	Усолье
1006	Усолье-Сибирское
1007	Уссурийск
1008	Усть-Джегута
1009	Усть-Илимск
1010	Усть-Катав
1011	Усть-Кут
1012	Усть-Лабинск
1013	Устюжна
1014	Уфа
1015	Ухта
1016	Учалы
1017	Уяр
1018	Фатеж
1019	Феодосия
1020	Фокино
1022	Фролово
1023	Фрязино
1024	Фурманов
1025	Хабаровск
1026	Хадыженск
1027	Ханты-Мансийск
1028	Харабали
1029	Харовск
1030	Хасавюрт
1031	Хвалынск
1032	Хилок
1033	Химки
1034	Холм
1035	Холмск
1036	Хотьково
1037	Цивильск
1038	Цимлянск
1039	Циолковский
1040	Чадан
1041	Чайковский
1042	Чапаевск
1043	Чаплыгин
1044	Чебаркуль
1045	Чебоксары
1046	Чегем
1047	Чекалин
1048	Челябинск
1049	Чердынь
1050	Черемхово
1051	Черепаново
1052	Череповец
1053	Черкесск
1054	Чёрмоз
1055	Черноголовка
1056	Черногорск
1057	Чернушка
1058	Черняховск
1059	Чехов
1060	Чистополь
1061	Чита
1062	Чкаловск
1063	Чудово
1064	Чулым
1065	Чусовой
1066	Чухлома
1067	Шагонар
1068	Шадринск
1069	Шали
1070	Шарыпово
1071	Шарья
1072	Шатура
1073	Шахты
1074	Шахунья
1075	Шацк
1076	Шебекино
1077	Шелехов
1078	Шенкурск
1079	Шилка
1080	Шимановск
1081	Шиханы
1082	Шлиссельбург
1083	Шумерля
1084	Шумиха
1085	Шуя
1086	Щёкино
1087	Щёлкино
1088	Щёлково
1089	Щигры
1090	Щучье
1091	Электрогорск
1092	Электросталь
1093	Электроугли
1094	Элиста
1095	Энгельс
1096	Эртиль
1097	Югорск
1098	Южа
1099	Южно-Сахалинск
1100	Южно-Сухокумск
1101	Южноуральск
1102	Юрга
1103	Юрьев-Польский
1104	Юрьевец
1105	Юрюзань
1106	Юхнов
1107	Ядрин
1108	Якутск
1109	Ялта
1110	Ялуторовск
1111	Янаул
1112	Яранск
1113	Яровое
1114	Ярославль
1115	Ярцево
1116	Ясногорск
1117	Ясный
1118	Яхрома
\.


--
-- TOC entry 3362 (class 0 OID 24852)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	USER
2	ADMIN
\.


--
-- TOC entry 3369 (class 0 OID 25004)
-- Dependencies: 225
-- Data for Name: trip_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trip_user (user_id, trip_id) FROM stdin;
10	2703
10	3003
1	2703
2	3003
2	3004
\.


--
-- TOC entry 3370 (class 0 OID 25007)
-- Dependencies: 226
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trips (id, departure_date_and_time, from_town, to_town, user_id) FROM stdin;
2703	2023-05-17	Старый Оскол	Магас	2
3003	2023-05-28	Набережные Челны	Кадников	1
3004	2023-05-26	Гагарин	Старая Русса	10
3552	2023-05-23	Уварово	Павлово	2
\.


--
-- TOC entry 3366 (class 0 OID 24864)
-- Dependencies: 222
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (user_id, role_id) FROM stdin;
1	1
2	2
9	1
10	1
\.


--
-- TOC entry 3367 (class 0 OID 24867)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, password) FROM stdin;
1	user	1
2	admin	1
9	test2	123
10	test	123
\.


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 214
-- Name: ad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ad_seq', 251, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 216
-- Name: cities_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_seq', 1, false);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 217
-- Name: city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_seq', 1, false);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 220
-- Name: trip_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trip_seq', 3001, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 221
-- Name: trips_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trips_seq', 3601, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- TOC entry 3202 (class 2606 OID 24876)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 24878)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 25011)
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 24884)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3208 (class 2606 OID 24886)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 25022)
-- Name: trips fk8wb14dx6ed0bpp3planbay88u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT fk8wb14dx6ed0bpp3planbay88u FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3213 (class 2606 OID 25017)
-- Name: trip_user fk9sdpli2eu54802tp90aw3pxyc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_user
    ADD CONSTRAINT fk9sdpli2eu54802tp90aw3pxyc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3214 (class 2606 OID 25012)
-- Name: trip_user fkbnvka9iwjv3vpdh1u2jl08k28; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip_user
    ADD CONSTRAINT fkbnvka9iwjv3vpdh1u2jl08k28 FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- TOC entry 3211 (class 2606 OID 24892)
-- Name: user_role fkj345gk1bovqvfame88rcx7yyx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkj345gk1bovqvfame88rcx7yyx FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3212 (class 2606 OID 24897)
-- Name: user_role fkt7e7djp752sqn6w22i6ocqy6q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkt7e7djp752sqn6w22i6ocqy6q FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2023-05-23 22:20:16

--
-- PostgreSQL database dump complete
--

