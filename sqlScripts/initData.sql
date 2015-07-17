
INSERT INTO ACCOUNT_TYPE 
  VALUES(SEQ_ACCOUNT_TYPE.NEXTVAL, 'WINERY');
INSERT INTO ACCOUNT_TYPE
  VALUES(SEQ_ACCOUNT_TYPE.NEXTVAL, 'IMPORTER');

INSERT INTO BUSINESS_ACCOUNT
  VALUES(SEQ_BUSINESS_ACCOUNT.NEXTVAL,
  'LEEUWIN ESTATE WINERY',
  'Stevens Rd, Margaret River, 6285 Western Australia',
  '61897590000',
  'info@leeuwinestate.com.au',
  'Y',
  (SELECT ACCOUNT_TYPE_ID FROM ACCOUNT_TYPE WHERE ACCOUNT_TYPE = 'WINERY'));
  
INSERT INTO BUSINESS_ACCOUNT
  VALUES(SEQ_BUSINESS_ACCOUNT.NEXTVAL,
  'VASSE FELIX',
  'PO Box 32 Cowaramup, WA 6284',
  '610897565000',
  'info@vassefelix.com.au',
  'Y',
  (SELECT ACCOUNT_TYPE_ID FROM ACCOUNT_TYPE WHERE ACCOUNT_TYPE = 'WINERY'));
  
INSERT INTO BUSINESS_ACCOUNT
  VALUES(SEQ_BUSINESS_ACCOUNT.NEXTVAL,
  'MAKO FINE WINE IMPORTERS',
  '10-5, Akasaka 1-chome, Minato-ku, Tokyo 107 (, Japan)',
  '818031111111',
  'info@mako.co.jp',
  'Y',
  (SELECT ACCOUNT_TYPE_ID FROM ACCOUNT_TYPE WHERE ACCOUNT_TYPE = 'IMPORTER'));

INSERT INTO BUSINESS_ACCOUNT
  VALUES(SEQ_BUSINESS_ACCOUNT.NEXTVAL,
  'MENSCHEN VINTAGE EXPERT IMPORTERS',
  'Bäckerstraße 781737 München',
  '493511253456',
  'info@menschenvintage.co.de',
  'Y',
  (SELECT ACCOUNT_TYPE_ID FROM ACCOUNT_TYPE WHERE ACCOUNT_TYPE = 'IMPORTER'));  


INSERT INTO USER_ACCOUNT
  VALUES(SEQ_USER_ACCOUNT.NEXTVAL,
  'MAKOWINES',
  'MYMAKO',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'MAKO FINE WINE IMPORTERS'));
  
INSERT INTO USER_ACCOUNT
  VALUES(SEQ_USER_ACCOUNT.NEXTVAL,
  'MENSCHENVINTAGE',
  'MUNCHENVINES',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'MENSCHEN VINTAGE EXPERT IMPORTERS'));

INSERT INTO USER_ACCOUNT
  VALUES(SEQ_USER_ACCOUNT.NEXTVAL,
  'LEEUWINWINES',
  'LEEUWINDOWNUNDER',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));

INSERT INTO USER_ACCOUNT
  VALUES(SEQ_USER_ACCOUNT.NEXTVAL,
  'FELIXESTATES',
  'WINE4FELIX',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));

INSERT INTO WINE
  VALUES(SEQ_WINE.NEXTVAL,
  'Classic Dry Red',
  2013,
  'Red Blend',
  50,
  'A classic Australian blend of Shiraz and Cabernet Sauvignon. Each variety is fermented separately and then matured in barriques, providing balance, complexity and softness. It is bright, lightly perfumed and succulent. Shiraz from Margaret River offers fruit sweetness and power, while Cabernet Sauvignon''s firm and defined tannins provide structure and length.',
  'APPEARANCE Bright dark Maroon NOSE A fragrant inviting aroma with raspberry, jam tart, a hint of liquorice and some lovely earthy tones of mushroom skin along with some toasty vanilla from oak influence. PALATE A very soft, fine silky palate entrance. A creamy luscious balance with plum skin and raspberry cream lolly flavours that finishes fresh and dry.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
INSERT INTO WINE
  VALUES (SEQ_WINE.NEXTVAL,
  'Shiraz',
  2013,
  'Shiraz',
  50,
  'This wine is made primarily from the oldest Shiraz vines in Margaret River and is fermented in small batches and matured in French barriques. Margaret River Shiraz is a delicate and structured style with elegance and finesse.',
  'APPEARANCE Deep red with a vibrant, ruby hue. NOSE A fine yet complex perfume with biscotti and crunchy pie crust beneath bright cranberry and raspberry fruit aromas. Hints of licorice, chocolate, dark spice and berry liqueur emerge and build the enticing character of the wine. PALATE Pristine bright plum and raspberry fruit flavours supported by a sustained fruit sweetness and fine, ripe drying tannins. Beautifully balanced, fluid and effortless in its transition through the palate.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
INSERT INTO WINE
  VALUES(SEQ_WINE.NEXTVAL,
  'Art Series Reisling',
  2013,
  'Reilsing',
  22,
  NULL,
  'Delicate with a subtle perfume.  A precise fruit spectrum of freshly cut limes and lemon skin weave harmoniously with elevated floral notes, hints a sweet spice and fragrant kaffir lime leaf. The palate has tension, it is taut and fine. The natural acid line gives definition and precision.  Lime flesh, lemon sherbet and Granny Smith apples grab the palate, which leads to a mineral and slightly chalky and elegant finish.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE
  VALUES(SEQ_WINE.NEXTVAL,
  'Art Series Cabernet Sauvignon',
  2011,
  'Cabernet Sauvignon',
  18,
  NULL,
  'A concentrated dark fruit spectrum with an abundance of ripe blackcurrants, cherries and a hint of cassis. Coffee bean, dark chocolate and black olives lie beneath. Subtle dustiness combines with a seductive violet lift, enhancing the varietal fragrance and increasing complexity. A dense and layered palate with incredible texture. The generosity of the palate is carefully laced with a fine and structural acid line. Dark cherries and currants weave through smokey and mocha notes, finishing with long tactile tannins.',  
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Classic Dry Red'),
  'JAPANESE',
  'Kurashikkudoraireddo',
  2013,
  'Aka burendo',
  50,
  'Shir?zu to kaberune· s?vu~iniyon no koten-tekina ?sutoraria no burendo. Kaku hinshu wa betsubetsu ni hakk? sa se, sonogo, baransu, fukuzatsu-sa to yawaraka-sa o teiky? shi, taru de jukusei sa rete imasu. Sore wa, akaruku karuku kaori o tsuke j?sh?desu. Kaberune· s?vu~iniyon'' no shikkari to teigi sa reta tan''nin wa, k?z? to naga-sa o teiky? shinagara, m?garettorib? kara no shir?zu wa, kajitsu no ama-sa to paw? o teiky? shite imasu.',
  'Gaikan buraitod?kumar?n''n?zurazuber? to kaori no miryoku-tekina kaori, jamutaruto, kanz? no hinto to ?ku no eiky? kara ikutsu ka no t?suto no banira to issho ni kinoko no hifu no ichibu no sutekina sobokuna shikich?. Hij? ni yawarakaku, komakai kinu no y?na k?gai no iriguchi o k?gai. Shinsen''na, kans? sh?ry? ume no kawa to razuber?kur?mukyand? no aji to kur?m?na kanbina baransu.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Shiraz'),
  'JAPANESE',
  'Sh?r?zu',
  2013,
  'Sh?r?zu',
  50,
  'Kono wain wa, m?garettorib? de mottomo furui shir?zu no bud? kara omo ni tsukura rete ori, ko rotto de hakk? shi, Furansu no taru de jukusei sa rete imasu. M?garettorib?shir?zu wa, y?ga-sa to sensai-sa to sensaina k?z?-ka sutairudesu.',
  'Kakki ni michita, rub? no shikich? o motsu gaikan fukai aka. N?zu bisukotti to akarui kuranber? ya razuber? no kajitsu no aroma no shita no karikaripai kiji de bi mada fukuzatsuna kaori. Kanz?, chokor?to, kurai supaisu ya ber?riky?ru no hinto ga detekuru to wain no miryoku-tekina kyarakut? o k?chiku shimasu. Jizoku-tekina kajitsu no ama-sa to bakkin, juku shita kans? tan''nin de sap?to sa rete iru shizen no mama no azayakana ume to razuber? no kajitsuaji o mikaku. Utsukushiku, baransu no toreta ry?tai to k?gai o kaishite no ik? de raku.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Classic Dry Red'),
  'GERMAN',
  'Klassischer Dry Red',
  2013,
  'rot Mischung',
  50,
  'Ein klassischer australischer Blend aus Shiraz und Cabernet Sauvignon. Jede Sorte wird separat vergoren und dann gereift in Barriques, die Bereitstellung Balance, Komplexität und Weichheit. Es ist hell, leicht parfümiert und saftig. Shiraz von Margaret River bietet Fruchtsüße und Macht, während Cabernet Sauvignon ''ist fest und definiert Tannine schaffen Struktur und Länge.',
  'Aussehen blank dunklen Maroon NOSE Dufte einladenden Aroma mit Himbeere, jam tart, ein Hauch von Lakritze und einige schöne Erdfarben Pilz Haut zusammen mit etwas wohlig Vanille aus Eichen Einfluss. Gaumen sehr weich, seidig feinen Gaumen Eingang. Eine cremige üppigen Gleichgewicht mit Pflaumen Haut und Himbeercreme lolly Aromen, frischen und trockenen Oberflächen.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Shiraz'),
  'GERMAN',
  'Shiraz',
  2013,
  'Shiraz',
  50,
  'Dieser Wein wird in erster Linie von den ältesten Shiraz Reben in Margaret River und ist in kleinen Chargen vergoren und in Französisch Barriques ausgebaut. Margaret River Shiraz ist eine heikle und strukturierten Stil mit Eleganz und Finesse.',
  'AUSSEHEN Tiefrote mit einer lebendigen, Rubin Farbton. NOSE Ein feiner, aber komplexen Duftstoff mit Biscotti und crunchy Tortenboden unter hellen Preiselbeeren und Himbeeren Fruchtaromen. Hauch von Lakritze, Schokolade, Gewürzen und dunklen Beerenlikör entstehen und bauen die verlockende Charakter des Weines. Pristine Gaumen durch eine anhaltende Fruchtsüße und feine, reife Tannine Trocknung unterstützt helle Pflaume und Himbeere Fruchtaromen. Schön ausgewogen, Flüssigkeit und mühelos in seinem Übergang über den Gaumen.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Reisling'),
  'JAPANESE',
  '?toshir?zu Reisling',
  2013,
  'Reisling',
  22,
  NULL,
  'Sensaina kaori to sensai.-Tate kattoraimu ya remon no kawa no ori no seikakuna fur?tsu no supekutoru wa, ch?wa no j?sh? fur?rarun?to to, amai supaisu to kaori no kaferaimur?fu o shisa shite imasu. K?gai wa, kinch? o motte sore ga pin to hatta to bakkindesu. Ten''nen no san rain wa, teigi to seido o teiky? shimasu. Raimu niku, remonsh?betto to guran?sumisuringo wa mineraru to wazuka hakua-shitsu to j?hin''na shiagari ni tsunagaru k?gai o, tsukami ma',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Cabernet Sauvignon'),
  'JAPANESE',
  '?toshir?zukaberune· s?vu~iniyon',
  2011,
  's?biniyon',
  18,
  NULL,
  'Juku shita burakkukaranto, cher? no yutaka-sa to kashisu no hinto to n?shuku sa reta d?kufur?tsu no supekutoru. K?h? mame, d?kuchokor?to to burakkuor?bu wa,-ka ni arimasu. Bimy?na hokori ppo-sa wa hinshu no kaori o takame, fukuzatsu-sa o masu, miwaku-tekina murasakiiro no rifuto to ketsug? shimasu. Shinji rarenai hodo no shitsukan ga missh? shite s?j? k?gai. K?gai no kandai-sa o shinch? ni bakkin oyobi k?z? san rain ga kon''ny? sa rete imasu. D?kucher? to karanto wa nagai shokkaku tan''nin de shiage, sum?k? to moka no n?to o t?shite ori.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Reisling'),
  'GERMAN',
  'Art Series Reisling',
  2013,
  'Reisling',
  22,
  NULL,
  'Delicate mit einem feinen Duft. Eine präzise Fruchtspektrum von frisch geschnittenem Limetten und Zitrone Haut weben harmonisch mit erhöhten floralen Noten, Hinweise eines süßen Gewürzen und duft Kaffernlimette Blatt. Der Gaumen hat Spannung, es straff und ist in Ordnung. Die natürliche Säure Zeile gibt Definition und Präzision. Lime Fleisch, Zitronensorbet und Granny Smith Äpfel greifen den Gaumen, die zu einem mineralischen und leicht kalkhaltigen und elegantes Finish führt.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE_TRANSLATION
  VALUES(SEQ_WINE_TRANSLATION.NEXTVAL,
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Cabernet Sauvignon'),
  'GERMAN',
  'Art Series Cabernet Sauvignon',
  2013,
  'Cabernet Sauvignon',
  18,
  NULL,
  'Eine konzentrierte dunkle Frucht-Spektrum mit einer Fülle von reifen schwarzen Johannisbeeren, Kirschen und einem Hauch Cassis. Kaffeebohne, dunkle Schokolade und schwarzen Oliven liegen unter. Subtile Staubigkeit kombiniert mit einer verführerischen violet Aufzug, die Verbesserung der Sortenduft und zunehmender Komplexität. Ein dichtes und geschichteten Gaumen mit unglaublichen Textur. Die Großzügigkeit der Gaumen wird vorsichtig mit einer feinen Säure und Strukturlinie geschnürt. Dunkle Kirschen und Johannisbeeren schlängeln sich durch smokey und Mokkanoten, Finishing mit langen taktile Tanninen.',
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'));
  
INSERT INTO WINE_IMAGE
  VALUES(SEQ_WINE_IMAGE.NEXTVAL,
  'DRYREDVASSEL.JPG',
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Classic Dry Red'));

INSERT INTO WINE_IMAGE
  VALUES(SEQ_WINE_IMAGE.NEXTVAL,
  'SHIRAZVASSE.JPG',
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Shiraz'));
  
INSERT INTO WINE_IMAGE
  VALUES(SEQ_WINE_IMAGE.NEXTVAL,
  'REISLINGLEEWIN.JPG',
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Reisling'));
  
INSERT INTO WINE_IMAGE
  VALUES(SEQ_WINE_IMAGE.NEXTVAL,
  'CABSAUGLEEUWIN.JPG',
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Cabernet Sauvignon'));
  
INSERT INTO WINERY_BIO
  VALUES((SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'),
  'Leeuwin Estate is one of the founding wineries of the now famous Margaret River district. In 1972, legendary Napa Valley winemaker, Robert Mondavi, first identified the future site of the Leeuwin vineyard as being ideal for the production of premium wine and provided early mentorship to Denis and Tricia Horgan who founded Leeuwin Estate in 1974. The initial vineyards were planted by hand over a five year period from 1975. Featuring state-of-the art facilities, the winery building was opened in 1978, celebrating with a trial vintage. Leeuwin enjoyed its first commercial vintage in 1979, and was thrust into the international spotlight when Decanter Magazine gave its highest recommendation to the 1980 "Art Series" Chardonnay in an international blind tasting. Maintaining a team of highly skilled and dedicated winemakers, Leeuwin Estate is now under the direction of two generations of the founding family.');
  
INSERT INTO WINERY_BIO
  VALUES((SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'),
  'Vasse Felix was established in 1967 by pioneer Dr Thomas Cullity and is the founding wine estate of Margaret River. Vasse Felix is situated in the Wilyabrup sub-region of Margaret River, with vineyards also located at northern and southern sites of the wine appellation. The first vineyard blocks were planted in August, 1967. Margaret River experiences the unique combination of a Mediterranean climate, maritime influence and perfect soils for viticulture. Together, these conditions are ideal for growing Cabernet Sauvignon and Chardonnay. The estate is recognised as one of Australia''s drawcard winery destinations and includes a Cellar Door, Restaurant and Art Gallery.');
  
INSERT INTO BIO_TRANSLATION
  VALUES(SEQ_BIO_TRANSLATION.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'),
  'JAPANESE',
  'R?u~in· esut?to wa ima no y?meina m?garettorib? chiku no s?setsu wainar? no hitotsudesu. 1972-Nen ni, densetsu-tekina napabar?wain seisan-sha, rob?to· mondavu~i wa ??, saisho no saisho no bud? hata o ueta 1974-nen ni r?u~in· esut?to o setsuritsu Denisu to torishiah?gan no puremiamu wain no seisan no tame no ris?-tekina teiky? no s?ki shid?dearu to r?u~in no bud? hata no sh?rai no saito o tokutei shi saisentan no setsubi o tokuch? to 1975-nen kara no 5-nenkan de,-te de, wainar? no tatemono wa toraiaruvu~int?ji de iwatte, 1978-nen ni ?pun shimashita. R?u~in wa, 1979-nen ni sono saisho no sh?gy? vu~int?ji o tanoshinda, to dekyanta-shi ga kokusai buraindo· teisutingu 1980-nen `?toshir?zu'' sharudone ni saik? no kankoku o ataeta toki ni, kokusai supottoraito ni oshidasa remashita. K?do ni jukuren shita sen''y? no wainm?k? no ch?mu o iji shi, r?u~in· esut?to wa, s?gy?-sha ichizoku no futasedai no shiji no shita ni narimashita.');
  
INSERT INTO BIO_TRANSLATION
  VALUES(SEQ_BIO_TRANSLATION.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'),
  'JAPANESE',
  'Vu~asufirikkusu wa Paionia hakase t?masukariti ni yotte 1967-nen ni setsuritsu sa re, m?garettorib? no s?setsu wain''esut?todesumashita. Bud?-en wa mata, wain no aperashion no hokubu to nanbu no bui ni ichi shite vu~asufirikkusu wa, m?garettorib? no Wilyabrup no sabu ry?iki ni ichi shite imasu. Saisho no bud?-en burokku ga 8 tsuki ni ue rareta, 1967-nen m?garettorib? wa chich?kaiseikik?, kaiy? no eiky? to bud? saibai ni saitekina doj? no yun?kuna kumiawase o keiken shimasu. Issho ni, korera no j?ken wa, kaberune· s?vu~iniyon to sharudone o seich? sa seru tame no ris?-tekidesu. Fud?san wa, ?sutoraria no drawcard wainar?-chi no hitotsu to shite ninshiki sa re, ser?doa, resutoran ya ?togyarar? ga fukuma rete imasu.');
  
INSERT INTO BIO_TRANSLATION
  VALUES(SEQ_BIO_TRANSLATION.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'LEEUWIN ESTATE WINERY'),
  'GERMAN',
  'Leeuwin Estate ist einer der Gründerweingüter des nun berühmten Viertel Margaret River. Im Jahr 1972 legendäre Napa Valley Winzer, Robert Mondavi, zuerst den zukünftigen Standort des Leeuwin Weinberg identifiziert als ideal für die Produktion von Premium-Wein und zur Verfügung gestellt frühen Mentoren zu Denis und Tricia Horgan, die Leeuwin Estate 1974 gegründet Die ersten Weinberge gepflanzt von Hand über einen Zeitraum von 5 Jahre 1975. Ausgestattet mit modernster Ausstattung, wurde das Weingut Gebäude im Jahr 1978 eröffnet, feiert mit einem Probe vintage. Leeuwin genossen ihre erste kommerzielle Jahrgang 1979, und wurde in das internationale Rampenlicht beim Decanter Magazine hat seine höchste Empfehlung an die 1980 "Art Series" Chardonnay in einer internationalen Blindverkostung. Die Aufrechterhaltung eines Team von hoch qualifizierten und engagierten Winzern, ist Leeuwin Estate nun unter der Leitung von zwei Generationen von der Gründerfamilie.');
  
INSERT INTO BIO_TRANSLATION
  VALUES(SEQ_BIO_TRANSLATION.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'VASSE FELIX'),
  'GERMAN',
  'Vasse Felix wurde 1967 von Pionier Dr. Thomas Cullity gegründet und ist Gründungs Weingut von Margaret River. Vasse Felix liegt im Wilyabrup Unterregion von Margaret River, mit Weinbergen auch im nördlichen und südlichen Gebiete von der Weinregion gelegen. Die ersten Weinberg Blöcke wurden im August gepflanzt, erlebt 1967 Margaret River die einzigartige Kombination von einem mediterranen Klima, maritime Einfluss und die perfekte Böden für den Weinbau. Zusammen sind diese Bedingungen ideal für den Anbau von Cabernet Sauvignon und Chardonnay. Das Anwesen ist als eine von Australiens "s drawcard Weingut Destinationen anerkannt und umfasst eine Cellar Door, Restaurant and Art Gallery.');
  
INSERT INTO IMPORT_ORDER
  VALUES(SEQ_IMPORT_ORDER.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'MAKO FINE WINE IMPORTERS'),
  TO_DATE('20150715', 'YYYYMMDD'),
  NULL);
  
INSERT INTO IMPORT_ORDER
  VALUES(SEQ_IMPORT_ORDER.NEXTVAL,
  (SELECT ACCOUNT_ID FROM BUSINESS_ACCOUNT WHERE COMPANY_NAME = 'MENSCHEN VINTAGE EXPERT IMPORTERS'),
  TO_DATE('20150620','YYYYMMDD'),
  TO_DATE('20150630', 'YYYYMMDD'));
  
INSERT INTO ORDER_ITEM
  VALUES(SEQ_ORDER_ITEM.NEXTVAL,
  (SELECT IO.ORDER_ID FROM IMPORT_ORDER IO JOIN BUSINESS_ACCOUNT BA ON IO.ACCOUNT_ID = BA.ACCOUNT_ID WHERE BA.COMPANY_NAME = 'MAKO FINE WINE IMPORTERS'),
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Cabernet Sauvignon'),
  10);
  
INSERT INTO ORDER_ITEM
  VALUES(SEQ_ORDER_ITEM.NEXTVAL,
  (SELECT IO.ORDER_ID FROM IMPORT_ORDER IO JOIN BUSINESS_ACCOUNT BA ON IO.ACCOUNT_ID = BA.ACCOUNT_ID WHERE BA.COMPANY_NAME = 'MAKO FINE WINE IMPORTERS'),
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Shiraz'),
  10);
  
INSERT INTO ORDER_ITEM
  VALUES(SEQ_ORDER_ITEM.NEXTVAL,
  (SELECT IO.ORDER_ID FROM IMPORT_ORDER IO JOIN BUSINESS_ACCOUNT BA ON IO.ACCOUNT_ID = BA.ACCOUNT_ID WHERE BA.COMPANY_NAME = 'MENSCHEN VINTAGE EXPERT IMPORTERS'),
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Art Series Reisling'),
  10);

INSERT INTO ORDER_ITEM
  VALUES(SEQ_ORDER_ITEM.NEXTVAL,
  (SELECT IO.ORDER_ID FROM IMPORT_ORDER IO JOIN BUSINESS_ACCOUNT BA ON IO.ACCOUNT_ID = BA.ACCOUNT_ID WHERE BA.COMPANY_NAME = 'MENSCHEN VINTAGE EXPERT IMPORTERS'),
  (SELECT WINE_ID FROM WINE WHERE NAME = 'Classic Dry Red'),
  10);
  