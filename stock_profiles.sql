--
-- PostgreSQL database dump
--

\restrict cNoqlE3byvk7tlpZih57RSbZHj2zJnIaUSjicdkEra0SwLhPwWzdSYK8RyIPTMz

-- Dumped from database version 15.17 (Homebrew)
-- Dumped by pg_dump version 15.17 (Homebrew)

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
-- Data for Name: stock_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stock_profiles (id, company_name, industry, logo, market_cap, shares, stock_id) FROM stdin;
1	Agilent Technologies Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/A.png	38413.57	282.43	10
2	Apple Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AAPL.png	4167977.92	14687.36	39
3	AbbVie Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ABBV.png	447616.97	1766.79	4
4	Airbnb Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ABNB.png	87729.73	593.50	12
5	Abbott Laboratories	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ABT.png	163939.38	1741.81	3
6	Arch Capital Group Ltd	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ACGL.png	34079.46	349.39	43
7	Accenture PLC	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ACN.png	78928.30	613.94	5
8	Adobe Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ADBE.png	80585.18	397.50	6
9	Analog Devices Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ADI.png	188458.84	487.09	35
10	Archer-Daniels-Midland Co	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ADM.png	37009.44	481.96	44
11	Automatic Data Processing Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ADP.png	89360.60	399.73	52
12	Autodesk Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ADSK.png	41410.86	211.00	51
13	Ameren Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AEE.png	32745.25	276.75	25
14	American Electric Power Company Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AEP.png	75461.93	567.65	26
15	AES Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AES.png	10462.02	713.16	8
16	Aflac Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AFL.png	61154.54	508.98	9
17	American International Group Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AIG.png	40067.68	530.21	28
18	Assurant Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AIZ.png	13101.88	49.55	48
19	Arthur J. Gallagher & Co.	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AJG.png	58061.97	259.60	47
20	Akamai Technologies Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AKAM.png	16470.72	145.39	13
21	Albemarle Corp	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ALB.png	15767.86	117.93	14
22	Align Technology Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ALGN.png	12778.82	71.62	16
23	Allstate Corp	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ALL.png	61680.63	257.42	19
24	Allegion PLC	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ALLE.png	12006.10	85.94	17
25	Applied Materials Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMAT.png	497685.52	793.96	40
26	Amcor PLC	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMCR.png	19894.73	462.35	24
27	Advanced Micro Devices Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMD.png	850488.67	1630.60	7
28	AMETEK Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AME.png	54440.30	229.20	32
29	Amgen Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMGN.png	193393.66	539.71	33
30	Ameriprise Financial Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMP.png	40706.30	89.90	31
31	American Tower Corp	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959033886.png	81806.16	465.89	29
32	Amazon.com Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AMZN.png	2503071.72	10757.11	23
33	Arista Networks Inc	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ANET.png	198450.33	1259.20	46
34	Aon PLC	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AON.png	70200.61	213.58	36
35	A O Smith Corp	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AOS.png	8506.78	137.83	2
36	APA Corp (US)	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APA.png	11668.05	353.47	37
37	Air Products and Chemicals Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APD.png	61858.47	222.68	11
38	Amphenol Corp	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APH.png	201413.98	1230.23	34
39	Apollo Global Management Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APO.png	68196.26	576.52	38
40	Applovin Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APP.png	160270.25	335.94	41
41	APTIV PLC	Auto Components	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/APTV.png	12764.95	211.62	42
42	Alexandria Real Estate Equities, Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959033376.png	9623.16	174.27	15
43	Ares Management Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ARES.png	24229.96	329.85	45
44	Atmos Energy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ATO.png	29239.35	166.92	50
45	AvalonBay Communities Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959034786.png	26972.72	141.87	54
46	Broadcom Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AVGO.png	1736611.90	4757.58	74
47	Avery Dennison Corp	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AVY.png	12679.05	76.49	55
48	American Water Works Co Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AWK.png	25909.82	195.28	30
49	Axon Enterprise Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AXON.png	37466.27	80.60	56
50	American Express Co	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AXP.png	232236.61	682.33	27
51	Autozone Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/AZO.png	51077.14	16.33	53
52	Boeing Co	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BA.png	171258.67	788.30	70
53	Bank of America Corp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BAC.png	410750.64	7096.59	59
54	Ball Corp	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BLL.png	16451.37	266.25	58
55	Baxter International Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BAX.png	11382.98	516.47	60
56	Best Buy Co Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BBY.png	16378.71	210.77	63
57	Becton Dickinson and Co	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BDX.png	42962.27	275.54	61
58	Franklin Resources Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BEN.png	17257.15	519.64	209
59	Brown-Forman Corp	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BF.B.png	12908.13	458.86	77
60	Bunge Global SA	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950866353246.png	21446.76	194.02	79
61	Biogen Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BIIB.png	31894.05	147.64	65
62	Booking Holdings Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BKNG.png	140609.44	774.88	71
63	Baker Hughes Co	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BKR.png	56111.40	992.07	57
64	Builders FirstSource Inc	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BLDR.png	9587.89	107.56	78
65	BlackRock Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950002356066.png	157094.25	162.84	66
66	Bristol-Myers Squibb Co	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BMY.png	117459.94	2042.07	73
67	Bank of New York Mellon Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BK.png	98536.58	686.38	69
68	Broadridge Financial Solutions Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BR.png	15952.75	115.66	75
69	Berkshire Hathaway Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BRK.B.png	1069842.98	1.44	62
70	Brown & Brown Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BRO.png	21767.23	338.95	76
71	Boston Scientific Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BSX.png	65741.49	1486.36	72
72	Blackstone Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/BX.png	140962.74	1187.55	67
73	BXP Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959035856.png	10748.78	159.48	80
74	Citigroup Inc	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/C.png	243105.28	1705.58	111
75	Conagra Brands Inc	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CAG.png	6736.40	478.44	123
76	Cardinal Health Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CAH.png	55722.26	234.21	86
77	Carrier Global Corp	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CARR.png	61122.41	830.58	88
78	Caseys General Stores Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CASY.png	28813.14	36.96	90
79	Caterpillar Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CAT.png	459471.62	460.59	91
80	Chubb Limited	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CB.png	132430.96	387.86	104
81	Cboe Global Markets Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CBOE.png	25348.19	104.65	92
82	CBRE Group Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CBRE.png	40233.00	292.82	93
83	Crown Castle Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950434155366.png	36059.66	436.45	137
84	Carnival Corp	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CCL.png	40211.89	1239.00	87
85	Cadence Design Systems Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CDNS.png	104057.11	275.82	82
86	CDW Corp	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CDW.png	17029.54	127.75	94
87	Constellation Energy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950815008846.png	94810.12	359.10	127
88	CF Industries Holdings Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CF.png	16238.62	153.63	98
89	Citizens Financial Group Inc	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CFG.png	29770.89	422.88	112
90	Church & Dwight Co Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CHD.png	23594.84	236.94	105
91	CH Robinson Worldwide Inc	Logistics & Transportation	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CHRW.png	21138.17	117.87	81
92	Charter Communications Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CHTR.png	18508.58	122.98	101
93	Cigna Group	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CI.png	74807.12	264.53	107
94	Ciena Corp	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CIEN.png	67874.62	141.55	106
95	Cincinnati Financial Corp	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CINF.png	28474.73	154.69	108
96	Colgate-Palmolive Co	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CL.png	73673.43	800.19	120
97	Clorox Co	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CLX.png	11794.67	120.92	113
98	Comcast Corp	Telecommunication	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CMCSA.png	82768.54	3572.23	121
99	CME Group Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CME.png	80081.42	362.36	114
100	Chipotle Mexican Grill Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CMG.png	42766.35	1282.73	103
101	Cummins Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CMI.png	94642.56	137.99	139
102	CMS Energy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CMS.png	24345.95	308.92	115
103	Centene Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CNC.png	32457.27	493.80	96
104	CenterPoint Energy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CNP.png	29463.79	654.17	97
105	Capital One Financial Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/COF.png	125667.97	616.02	85
106	Coherent Corp	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IIVI.png	74452.50	195.64	118
107	Coinbase Global Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/COIN.png	39271.50	263.46	119
108	Cooper Companies Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/COO.png	13851.07	195.03	128
109	ConocoPhillips	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/COP.png	129090.43	1218.29	124
110	Cencora Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ABC.png	55669.76	194.56	95
111	Costco Wholesale Corp	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/COST.png	422431.31	443.48	134
112	Corpay Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FLT.png	21731.53	65.36	131
113	Campbell's Co	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CPB.png	6778.23	298.21	84
114	Copart Inc	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CPRT.png	28283.54	925.81	129
115	Camden Property Trust	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959036796.png	15727.41	100.52	83
116	CRH PLC	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CRH.L.png	75052.25	668.20	135
117	Charles River Laboratories International Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CRL.png	10392.19	48.17	99
118	Salesforce Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CRM.png	129705.03	819.00	404
119	CrowdStrike Holdings Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CRWD.png	178472.86	254.56	136
120	Cisco Systems Inc	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950800186156.png	448417.04	3941.43	110
121	Costar Group Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CSGP.png	12352.76	408.36	133
122	CSX Corp	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CSX.png	88558.90	1858.14	138
123	Cintas Corp	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CTAS.png	68774.98	400.14	109
124	Cognizant Technology Solutions Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CTSH.png	18969.00	473.87	117
125	Corteva Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CTVA.png	55257.91	668.82	132
126	Carvana Co	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CVNA.png	68387.71	1096.84	89
127	CVS Health Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CVS.png	133130.25	1275.93	140
128	Chevron Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CVX.png	340682.73	1991.60	102
129	Dominion Energy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/D.png	61029.38	879.51	155
130	Delta Air Lines Inc	Airlines	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DAL.png	60817.96	656.99	148
131	DoorDash Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DASH.png	79775.75	435.72	157
132	Dupont De Nemours Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DD.png	18527.36	405.06	163
133	Datadog Inc (Pre-Reincorporation)	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DDOG.png	85348.58	355.96	143
134	Deere & Co	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DE.png	165536.44	269.94	146
135	Deckers Outdoor Corp	Textiles, Apparel & Luxury Goods	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DECK.png	14521.39	138.88	145
136	Dell Technologies Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DELL.png	258981.80	648.11	147
137	Dollar General Corp	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DG.png	26362.31	220.59	153
138	Quest Diagnostics Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DGX.png	23232.97	110.70	385
139	D.R. Horton Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DHI.png	47156.45	283.58	160
187	FedEx Freight Holding Company Inc	Road & Rail		22915.17	119.30	198
140	Danaher Corp	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DHR.png	138857.52	707.77	141
141	Walt Disney Co	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DIS.png	171549.96	1736.51	483
142	Digital Realty Trust Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959090646.png	67821.37	351.41	152
143	Dollar Tree Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DLTR.png	23804.67	192.17	154
144	Healthpeak Properties Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950838215036.png	15223.34	689.42	231
145	Dover Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DOV.png	30428.09	134.66	158
146	Dow Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DOW.png	20930.33	720.74	159
147	Domino's Pizza Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DPZ.png	9918.98	33.26	156
148	Darden Restaurants Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DRI.png	24478.42	114.54	142
149	DTE Energy Co	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DTE.png	32125.81	208.03	161
150	Duke Energy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DUK.png	100100.15	779.60	162
151	DaVita Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DVA.png	13933.97	64.20	144
152	Devon Energy Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DVN.png	48685.14	1153.40	149
153	Dexcom Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/DXCM.png	27065.13	385.87	150
154	Electronic Arts Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EA.png	51466.74	250.75	170
155	eBay Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EBAY.png	47894.28	444.00	165
156	Ecolab Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ECL.png	79829.75	281.44	167
157	Consolidated Edison Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ED.png	41297.44	368.53	125
158	Equifax Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EFX.png	18870.59	119.07	177
159	Everest Group Ltd	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RE.png	14068.50	39.57	183
160	Edison International	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EIX.png	29117.36	384.79	168
161	Estee Lauder Companies Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EL.png	29138.96	361.79	182
162	Elevance Health Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ANTM.png	85818.23	217.16	171
163	EMCOR Group Inc	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EME.png	35467.78	44.44	172
164	Emerson Electric Co	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EMR.png	80368.74	560.10	173
165	EOG Resources Inc	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EOG.png	70626.53	532.63	175
166	Equinix Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959004916.png	107628.65	98.62	178
167	Equity Residential	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959039466.png	25620.05	374.71	179
168	EQT Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EQT.png	32962.69	625.48	176
169	Erie Indemnity Co	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ERIE.png	11116.81	52.29	180
170	Eversource Energy	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ES.png	27634.36	376.08	185
171	Essex Property Trust Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959039476.png	18979.40	64.26	181
172	Eaton Corporation PLC	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ETN.png	156360.64	388.30	164
173	Entergy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ETR.png	53073.66	457.89	174
174	Evergy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EVRG.png	20103.04	230.51	184
175	Edwards Lifesciences Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EW.png	52271.12	575.80	169
176	Exelon Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EXC.png	48500.07	1023.21	186
177	Expand Energy Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/CHK.png	21164.58	239.23	187
178	Expeditors International of Washington Inc	Logistics & Transportation	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EXPD.png	21022.06	130.79	189
179	Expedia Group Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/EXPE.png	31541.68	120.02	188
180	Extra Space Storage Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959025646.png	31522.25	211.26	190
181	Ford Motor Co	Automobiles	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/F.png	56303.71	3984.69	204
182	Diamondback Energy Inc	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FANG.png	50611.08	281.31	151
183	Fastenal Co	Trading Companies & Distributors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FAST.png	54072.45	1148.04	195
184	Freeport-McMoRan Inc	Metals & Mining	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FCX.png	89775.61	1437.56	210
185	Factset Research Systems Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FDS.png	8442.55	36.43	193
186	FedEx Corp	Logistics & Transportation	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FDX.png	76003.41	238.61	197
188	FirstEnergy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FE.png	28036.56	578.43	202
189	F5 Inc	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FFIV.png	22259.09	56.42	192
190	Fair Isaac Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FICO.png	27429.97	23.19	194
191	Fidelity National Information Services Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FIS.png	19936.03	516.88	199
192	Fiserv Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FISV.png	26369.41	533.25	203
193	Fifth Third Bancorp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FITB.png	51034.41	906.31	200
194	Comfort Systems USA Inc	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FIX.png	65273.39	35.20	122
195	Fox Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FOXA.png	20026.71	419.90	208
196	Fox Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FOXA.png	20026.71	419.90	207
197	Federal Realty Investment Trust	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950824606406.png	10871.40	86.39	196
198	First Solar Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FSLR.png	25688.88	107.45	201
199	Fortinet Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FTNT.png	110886.33	732.65	205
200	Fortive Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FTV.png	18742.86	304.86	206
201	General Dynamics Corp	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GD.png	93760.85	270.43	218
202	GoDaddy Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GDDY.png	11195.25	132.41	225
203	General Electric Co	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GE.png	384991.44	1043.34	213
204	GE Healthcare Technologies Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950835041476.png	29913.68	454.89	214
205	Gen Digital Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NLOK.png	14729.51	602.43	216
206	GE Vernova Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950867201126.png	280858.08	268.72	215
207	Gilead Sciences, Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GILD.png	158771.94	1241.57	222
208	General Mills Inc	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GIS.png	19217.86	533.68	219
209	Globe Life Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GL.png	13922.48	77.64	224
210	Corning Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GLW.png	190243.98	860.64	130
211	General Motors Co	Automobiles	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GM.png	70420.05	901.67	220
212	Generac Holdings Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GNRC.png	16401.99	58.87	217
213	Alphabet Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GOOG.png	4107574.80	12174.56	21
214	Alphabet Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GOOG.png	4107574.80	12174.56	20
215	Genuine Parts Co	Distributors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GPC.png	15967.20	137.62	221
216	Global Payments Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GPN.png	19093.34	273.54	223
217	Garmin Ltd	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GRMN.png	44841.00	192.86	211
218	Goldman Sachs Group Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GS.png	300792.50	295.01	226
219	WW Grainger Inc	Trading Companies & Distributors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/GWW.png	63908.15	47.21	480
220	Halliburton Co	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HAL.png	28578.96	835.40	227
221	Hasbro Inc	Leisure Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HAS.png	12073.40	141.49	229
222	Huntington Bancshares Inc	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HBAN.png	36062.65	2027.13	244
223	HCA Healthcare Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HCA.png	86890.21	221.84	230
224	Home Depot Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HD.png	347854.13	997.12	236
225	Hartford Insurance Group Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HIG.png	36703.37	274.13	228
226	Huntington Ingalls Industries Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HII.png	11111.54	39.40	245
227	Hilton Worldwide Holdings Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HLT.png	75775.04	227.65	235
228	Honeywell International Inc	Industrial Conglomerates	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942965692746.png	147140.60	633.77	237
229	Robinhood Markets Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HOOD.png	88949.82	900.51	397
230	Hewlett Packard Enterprise Co	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HPE.png	57880.94	1324.20	234
231	HP Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HPQ.png	20924.28	914.52	241
232	Hormel Foods Corp	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HRL.png	14588.85	550.31	238
233	Henry Schein Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HSIC.png	9677.23	113.92	232
234	Host Hotels and Resorts, Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959121596.png	17163.07	684.88	239
235	Hershey Co	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HSY.png	36331.32	202.84	233
236	Hubbell Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HUBB.png	27320.25	52.84	242
237	Humana Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HUM.png	46084.41	120.06	243
238	Howmet Aerospace Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/HWM.png	107576.90	400.11	240
239	Interactive Brokers Group Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IBKR.png	152354.48	1696.22	254
240	International Business Machines Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IBM.png	255301.02	939.89	246
241	Intercontinental Exchange Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ICE.png	70044.38	565.51	255
242	IDEXX Laboratories Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IDXX.png	43503.98	78.88	248
243	IDEX Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IEX.png	16815.48	74.02	247
244	International Flavors & Fragrances Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IFF.png	19492.42	255.30	256
245	Incyte Corp	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/INCY.png	22725.22	199.78	250
246	Intel Corp	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/INTC.png	644936.30	5026.00	253
247	Intuit Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/INTU.png	73231.32	273.54	258
248	Invitation Homes Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950527954066.png	18094.52	594.04	261
249	International Paper Co	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IP.png	20524.08	529.52	257
250	IQVIA Holdings Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IQV.png	31901.26	166.90	262
251	Ingersoll Rand Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IR.png	31843.08	391.34	251
252	Iron Mountain Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950443403966.png	39404.17	297.52	263
253	Intuitive Surgical Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ISRG.png	143329.70	354.16	259
254	Gartner Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IT.png	9035.83	66.95	212
255	Illinois Tool Works Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ITW.png	77020.17	287.70	249
256	Invesco Ltd	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/IVZ.png	11596.64	443.30	260
257	Jacobs Solutions Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950834406116.png	14841.59	118.08	267
258	J B Hunt Transport Services Inc	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JBHT.png	26432.07	94.30	264
259	Jabil Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JBL.png	37833.24	105.50	265
260	Johnson Controls International PLC	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JCI.png	84440.00	610.12	269
261	Jack Henry & Associates Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JKHY.png	9591.86	71.05	266
262	Johnson & Johnson	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JNJ.png	613021.90	2407.22	268
263	JPMorgan Chase & Co	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/JPM.png	881693.24	2679.51	270
264	Keurig Dr Pepper Inc	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KDP.png	45442.69	1360.56	272
265	KeyCorp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KEY.png	25106.11	1084.23	273
266	Keysight Technologies Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KEYS.png	56166.47	170.90	274
267	Kraft Heinz Co	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KHC.png	28102.93	1185.78	280
268	Kimco Realty Corp	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950837611476.png	17459.95	674.39	276
269	KKR & Co Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950831440326.png	80925.29	897.87	278
270	KLA Corp	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KLAC.png	324792.27	1306.28	279
271	Kimberly-Clark Corp	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KMB.png	36304.31	331.94	275
272	Kinder Morgan Inc	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KMI.png	73841.96	2224.83	277
273	Coca-Cola Co	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KO.png	355514.11	4302.48	116
274	Kroger Co	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/KR.png	35594.05	616.56	281
275	Kenvue Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950835574756.png	36729.76	1920.01	271
276	Loews Corp	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/L.png	23303.33	205.77	293
277	Leidos Holdings Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LDOS.png	12799.93	125.79	286
278	Lennar Corp	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LEN.png	22967.60	246.30	287
279	Labcorp Holdings Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950872209396.png	22260.54	82.00	283
280	L3Harris Technologies Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LHX.png	54258.40	186.29	282
281	Lennox International Inc	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LII.png	19622.66	34.80	288
282	Linde PLC	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950838588696.png	240375.97	462.35	290
283	Lumentum Holdings Inc	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LITE.png	63561.04	77.80	296
284	Eli Lilly and Co	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LLY.png	1137736.55	941.74	289
285	Lockheed Martin Corp	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LMT.png	116987.98	230.56	292
286	Alliant Energy Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LNT.png	19951.90	258.28	18
287	Lowe's Companies Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LOW.png	124746.11	560.71	294
288	Lam Research Corp	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LRCX.png	474078.99	1250.57	284
289	Lululemon Athletica Inc	Textiles, Apparel & Luxury Goods	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LULU.png	13952.03	113.55	295
290	Southwest Airlines Co	Airlines	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LUV.png	25372.24	488.77	419
291	Las Vegas Sands Corp	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LVS.png	31223.47	662.64	285
292	LyondellBasell Industries NV	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LYB.png	17988.80	322.78	297
293	Live Nation Entertainment Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/LYV.png	41762.64	232.71	291
294	Mastercard Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MA.png	440926.04	883.58	304
295	Mid-America Apartment Communities Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959045286.png	16377.67	116.38	317
296	Marriott International Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MAR.png	99492.36	263.69	300
297	Masco Corp	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MAS.png	16132.70	201.73	303
298	McDonald's Corp	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MCD.png	191666.07	710.51	306
299	Microchip Technology Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MCHP.png	47665.03	542.08	314
300	McKesson Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MCK.png	89390.03	117.08	307
301	Moody's Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MCO.png	78616.75	174.70	323
302	Mondelez International Inc	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MDLZ.png	78033.07	1283.65	320
303	Medtronic PLC	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MDT.png	103658.06	1283.88	308
304	MetLife Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MET.png	55303.39	643.44	311
305	Meta Platforms Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/FB.png	1396767.31	2538.42	310
306	MGM Resorts International	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MGM.png	12585.32	255.85	313
307	McCormick & Company Inc	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MKC.png	13726.53	268.84	305
308	Martin Marietta Materials Inc	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MLM.png	36991.88	60.05	302
309	3M Co	Industrial Conglomerates	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MMM.png	85542.25	521.57	1
310	Monster Beverage Corp	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MNST.png	94260.42	978.01	322
311	Altria Group Inc	Tobacco	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MO.png	123221.27	1669.89	22
312	Mosaic Co	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MOS.png	7113.41	317.85	325
313	Marathon Petroleum Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MPC.png	74169.42	291.94	299
314	Monolithic Power Systems Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MPWR.png	64523.42	49.13	321
315	Merck & Co Inc	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MRK.png	317767.61	2469.82	309
316	Moderna Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MRNA.png	26691.81	396.79	318
317	Marsh & McLennan Companies Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MMC.png	81437.72	481.79	301
318	Morgan Stanley	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MS.png	334431.71	1577.28	324
319	MSCI Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MSCI.png	40393.08	72.80	327
320	Microsoft Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MSFT.png	2770583.14	7428.43	316
321	Motorola Solutions Inc	Communications	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MSI.png	66877.96	166.00	326
322	M&T Bank Corp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MTB.png	34745.56	146.45	298
323	Mettler-toledo International Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MTD.png	25537.36	20.21	312
324	Micron Technology Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/MU.png	1276967.11	1127.73	315
325	Norwegian Cruise Line Holdings Ltd	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NCLH.png	9751.50	459.11	341
326	Nasdaq Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NDAQ.png	44428.89	565.54	328
327	Nordson Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NDSN.png	16797.29	55.72	337
328	Nextera Energy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NEE.png	184701.21	2085.61	334
329	Newmont Corporation	Metals & Mining	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NEM.png	102623.84	1067.55	331
330	Netflix Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NFLX.png	310799.03	4210.80	330
331	NiSource Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NI.png	23530.88	479.44	336
332	Nike Inc	Textiles, Apparel & Luxury Goods	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NKE.png	60346.16	1480.89	335
333	Northrop Grumman Corp	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NOC.png	71020.99	142.03	340
334	ServiceNow Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NOW.png	101418.82	1031.31	410
335	NRG Energy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NRG.png	31512.94	210.99	342
336	Norfolk Southern Corp	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NSC.png	70255.25	224.59	338
337	NetApp Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NTAP.png	29867.99	195.92	329
338	Northern Trust Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NTRS.png	32174.17	185.05	339
339	Nucor Corp	Metals & Mining	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NUE.png	54607.73	227.74	343
340	NVIDIA Corp	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NVDA.png	4659226.13	24200.00	344
341	NVR Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NVR.png	18432.44	2.70	345
342	News Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NWSA.png	14524.04	547.45	333
343	News Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NWSA.png	14524.04	547.45	332
344	NXP Semiconductors NV	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/NXPI.png	69939.54	252.47	346
345	Realty Income Corp	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959030586.png	58858.93	932.49	390
346	Old Dominion Freight Line Inc	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ODFL.png	45501.38	207.97	349
347	ONEOK Inc	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/OKE.png	56211.53	630.03	352
348	Omnicom Group Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/OMC.png	20831.10	285.01	350
349	ON Semiconductor Corp	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ON.png	35526.02	391.90	351
350	Oracle Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ORCL.png	427836.37	2876.05	353
351	O'Reilly Automotive Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ORLY.png	74211.44	828.72	347
352	Otis Worldwide Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/OTIS.png	28084.18	383.72	354
353	Occidental Petroleum Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/OXY.png	49721.79	994.63	348
354	Palo Alto Networks Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PANW.png	247923.00	815.00	358
355	Paychex Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PAYX.png	35793.26	358.29	361
356	Paccar Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PCAR.png	63512.23	526.29	355
357	PG&E Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PCG.png	38274.67	2202.22	366
358	Public Service Enterprise Group Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PEG.png	41649.70	498.32	379
359	PepsiCo Inc	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PEP.png	193247.39	1366.77	364
360	Pfizer Inc	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PFE.png	138439.49	5699.44	365
361	Principal Financial Group Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PFG.png	23275.34	216.01	374
362	Procter & Gamble Co	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PG.png	347007.84	2328.60	375
363	Progressive Corp	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PGR.png	131090.03	583.50	376
364	Parker-Hannifin Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PH.png	122167.62	126.09	360
365	Pultegroup Inc	Consumer products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PHM.png	26212.83	190.49	382
366	Packaging Corp of America	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PKG.png	21521.78	89.10	356
367	Prologis Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959032636.png	133255.78	932.34	377
368	Palantir Technologies Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PLTR.png	270728.47	2397.31	357
369	Philip Morris International Inc	Tobacco	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PM.png	281740.67	1558.56	367
370	PNC Financial Services Group Inc	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PNC.png	98379.32	401.56	370
371	Pentair PLC	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PNR.png	12349.90	161.61	363
372	Pinnacle West Capital Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PNW.png	13097.91	121.19	369
373	Insulet Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PODD.png	10961.13	69.26	252
374	Pool Corp	Distributors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/POOL.png	7711.70	36.44	371
375	PPG Industries Inc	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PPG.png	27470.20	222.90	372
376	PPL Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PPL.png	27852.01	752.35	373
377	Prudential Financial Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PRU.png	37562.75	347.00	378
378	Public Storage	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950680574146.png	56956.28	175.58	381
379	Paramount Skydance Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PARA.png	10788.83	1119.17	359
380	Phillips 66	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PSX.png	68820.50	400.94	368
381	PTC Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PTC.png	13366.33	115.51	380
382	Quanta Services Inc	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PWR.png	103221.88	150.06	383
383	PayPal Holdings Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PYPL.png	39068.45	882.11	362
384	Qnity Electronics Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950940770316.png	33117.46	209.34	386
385	Qualcomm Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/QCOM.png	199617.05	1054.00	384
386	Royal Caribbean Cruises Ltd	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RCL.png	85320.87	268.19	402
387	Regency Centers Corp	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959048126.png	14979.15	183.10	391
388	Regeneron Pharmaceuticals Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/REGN.png	66352.62	104.84	392
389	Regions Financial Corp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RF.png	25652.59	853.38	393
390	Raymond James Financial Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RJF.png	29220.76	194.88	388
391	Ralph Lauren Corp	Textiles, Apparel & Luxury Goods	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RL.png	24478.44	59.52	387
392	Resmed Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RMD.png	29053.35	145.06	395
393	Rockwell Automation Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ROK.png	53057.65	111.27	398
394	Rollins Inc	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ROL.png	20832.93	481.46	399
395	Roper Technologies Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ROP.png	34141.35	100.92	400
396	Ross Stores Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ROST.png	68409.77	320.78	401
397	Republic Services Inc	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RSG.png	66575.43	307.66	394
398	RTX Corp	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/RTX.png	253163.00	1346.68	389
399	Revvity Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/PKI.png	12608.49	111.56	396
400	EchoStar Corp	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SATS.png	30115.97	289.81	166
401	SBA Communications Corp	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950521363966.png	19490.14	106.06	406
402	Starbucks Corp	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SBUX.png	119212.62	1139.70	421
403	Charles Schwab Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SCHW.png	157687.42	1739.14	100
404	Sherwin-Williams Co	Chemicals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SHW.png	84859.91	246.64	411
405	J.M. Smucker Co	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SJM.png	12334.41	106.66	414
406	SLB NV	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SLB.png	70267.71	1495.06	407
407	Super Micro Computer Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SMCI.png	19813.72	646.83	426
408	Snap-On Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SNA.png	20570.54	51.80	416
409	Sandisk Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950906460416.png	309612.76	148.09	405
410	Synopsys Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SNPS.png	86996.71	191.48	428
411	Southern Co	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SO.png	109528.58	1127.30	418
412	Solventum Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950867918106.png	13772.58	173.17	417
413	Simon Property Group Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959049246.png	73576.33	324.29	412
414	S&P Global Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SPGI.png	120815.36	296.00	403
415	Sempra	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SRE.png	61623.36	653.71	409
416	STERIS plc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/STE.png	21018.70	97.46	424
417	Steel Dynamics Inc	Metals & Mining	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/STLD.png	35402.80	144.21	423
418	State Street Corp	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/STT.png	46527.30	276.77	422
465	Visa Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/V.png	627639.71	1884.12	476
419	Seagate Technology Holdings PLC	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/STX.png	201783.66	226.25	408
420	Constellation Brands Inc	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/STZ.png	25089.02	171.49	126
421	Smurfit WestRock PLC	Packaging	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950871067526.png	24562.57	524.51	415
422	Stanley Black & Decker Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SWK.png	14298.80	155.46	420
423	Skyworks Solutions Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SWKS.png	10227.61	150.41	413
424	Synchrony Financial	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SYF.png	26458.88	336.37	427
425	Stryker Corp	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SYK.png	127547.95	383.36	425
426	Sysco Corp	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SYY.png	39603.08	478.18	429
427	AT&T Inc	Telecommunication	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/T.png	157866.26	6948.34	49
428	Molson Coors Beverage Co	Beverages	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TAP.png	7826.05	177.78	319
429	TransDigm Group Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TDG.png	74087.39	55.93	449
430	Teledyne Technologies Inc	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TDY.png	28922.82	46.33	437
431	Bio-Techne Corp	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TECH.png	11116.38	156.57	64
432	TE Connectivity PLC	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TEL.png	57719.48	291.90	436
433	Teradyne Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TER.png	68387.01	156.54	438
434	Truist Financial Corp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TFC.png	62904.44	1245.88	452
435	Target Corp	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TGT.png	63763.90	454.19	435
436	TJX Companies Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TJX.png	171704.22	1104.70	444
437	TKO Group Holdings Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950865844746.png	41260.34	191.13	445
438	Thermo Fisher Scientific Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TMO.png	190652.96	371.62	443
439	T-Mobile US Inc	Telecommunication	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TMUS.png	197697.16	1082.20	430
440	Texas Pacific Land Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TPL.png	27299.39	68.97	441
441	Tapestry Inc	Textiles, Apparel & Luxury Goods	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TPR.png	29498.53	202.04	433
442	Targa Resources Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TRGP.png	58514.08	214.64	434
443	Trimble Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TRMB.png	11818.75	233.11	451
444	T Rowe Price Group Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TROW.png	23627.18	214.27	431
445	Travelers Companies Inc	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TRV.png	69613.49	212.64	450
446	Tractor Supply Co	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TSCO.png	16368.07	524.45	447
447	Tesla Inc	Automobiles	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TSLA.png	1426085.80	3755.72	439
448	Tyson Foods Inc	Food Products	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TSN.png	20207.27	352.13	454
449	Trane Technologies PLC	Building	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TT.png	105640.20	221.06	448
450	Trade Desk Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TTD.png	8635.90	470.11	446
451	Take-Two Interactive Software Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TTWO.png	44287.07	185.67	432
452	Texas Instruments Inc	Semiconductors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TXN.png	259763.25	910.09	440
453	Textron Inc	Aerospace & Defense	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TXT.png	15862.15	173.89	442
454	Tyler Technologies Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/TYL.png	12414.10	42.17	453
455	United Airlines Holdings Inc	Airlines	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UAL.png	44177.18	324.57	460
456	Uber Technologies Inc	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UBER.png	155112.64	2035.60	456
457	UDR Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959051706.png	12990.13	324.92	457
458	Universal Health Services Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UHS.png	8849.20	60.54	464
459	Ulta Beauty Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ULTA.png	20996.84	42.99	458
460	UnitedHealth Group Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UNH.png	369514.85	908.14	463
461	Union Pacific Corp	Road & Rail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UNP.png	158788.60	593.71	459
462	United Parcel Service Inc	Logistics & Transportation	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/UPS.png	93517.69	850.01	461
463	United Rentals Inc	Trading Companies & Distributors	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/URI.png	67019.91	62.65	462
464	US Bancorp	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/USB.png	91414.93	1552.30	455
466	Veeva Systems Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VEEV.png	26539.98	162.44	466
467	VICI Properties Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950577766676.png	30610.50	1092.84	475
468	Valero Energy Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VLO.png	72490.20	296.93	465
469	Veralto Corp	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950867112376.png	20625.43	245.60	468
470	Vulcan Materials Co	Construction	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VMC.png	39034.16	129.75	478
471	Verisk Analytics Inc	Professional Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VRSK.png	23532.83	131.02	470
472	VeriSign, Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VRSN.png	24922.17	91.00	469
473	Vertiv Holdings Co	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VRT.png	115079.00	384.11	473
474	Vertex Pharmaceuticals Inc	Biotechnology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VRTX.png	115017.00	253.81	472
475	Vistra Corp	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VST.png	53480.51	337.18	477
476	Ventas Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959052106.png	40784.78	486.17	467
477	Viatris Inc	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VTRS.png	18679.42	1164.55	474
478	Verizon Communications Inc	Telecommunication	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/VZ.png	195123.87	4175.56	471
479	Westinghouse Air Brake Technologies Corp	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WAB.png	46172.60	169.68	481
480	Waters Corp	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WAT.png	35399.93	98.19	486
481	Warner Bros Discovery Inc	Media	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959073106.png	66689.84	2507.14	484
482	Workday Inc	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WDAY.png	31312.19	247.00	496
483	Western Digital Corp	Technology	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WDC.png	234756.11	344.68	491
484	WEC Energy Group Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WEC.png	37350.96	325.73	487
485	Welltower Inc	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/950834235796.png	150712.74	705.91	489
486	Wells Fargo & Co	Banking	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WFC.png	260269.12	3060.19	488
487	Waste Management Inc	Commercial Services & Supplies	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WM.png	87780.44	401.58	485
488	Williams Companies Inc	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WMB.png	87419.92	1223.00	494
489	Walmart Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WMT.png	963166.32	7958.08	482
490	W. R. Berkley Corp	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WRB.png	25452.56	372.28	479
491	Williams-Sonoma Inc	Retail	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WSM.png	26749.68	117.75	493
492	West Pharmaceutical Services Inc	Life Sciences Tools & Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WST.png	23284.03	70.65	490
493	Willis Towers Watson PLC	Insurance	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WTW.png	24523.42	94.45	495
494	Weyerhaeuser Co	Real Estate	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/942959032556.png	17874.66	721.04	492
495	Wynn Resorts Ltd	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/WYNN.png	10759.57	103.79	497
496	Xcel Energy Inc	Utilities	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/XEL.png	49304.81	624.27	498
497	Exxon Mobil Corp	Energy	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/XOM.png	588002.20	4144.95	191
498	Xylem Inc	Machinery	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/XYL.png	26628.80	237.69	499
499	Block Inc	Financial Services	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/SQ.png	44448.12	595.18	68
500	Yum! Brands Inc	Hotels, Restaurants & Leisure	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/YUM.png	43457.19	275.62	500
501	Zimmer Biomet Holdings, Inc	Health Care	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ZBH.png	17282.00	193.46	502
502	Zebra Technologies Corp	Electrical Equipment	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ZBRA.png	11307.69	47.63	501
503	Zoetis Inc	Pharmaceuticals	https://static2.finnhub.io/file/publicdatany/finnhubimage/stock_logo/ZTS.png	33257.37	419.23	503
\.


--
-- Name: stock_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stock_profiles_id_seq', 503, true);


--
-- PostgreSQL database dump complete
--

\unrestrict cNoqlE3byvk7tlpZih57RSbZHj2zJnIaUSjicdkEra0SwLhPwWzdSYK8RyIPTMz

