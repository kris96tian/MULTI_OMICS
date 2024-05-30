####################################################
######                                        ######
######       Install   cosmoR                 ######
######                                        ######
####################################################
if (!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

devtools::install_github("saezlab/cosmosR")
####################################################

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("MOFA2")
####################################################
## DecoupleR is used to score various regulatory interactions.
if (!requireNamespace("BiocManager", quietly = TRUE)) 
  install.packages("BiocManager")
if (!requireNamespace("decoupleR", quietly = TRUE)) 
BiocManager::install("saezlab/decoupleR")

## We are using the LIANA package to process the LR interactions.

if (!requireNamespace("remotes", quietly = TRUE)) 
install.packages("remotes")
if (!requireNamespace("liana", quietly = TRUE)) 
remotes::install_github('saezlab/liana')
####################################################


library("cosmosR")



##The list of genes in the differential expression data will also be used as a reference to define which genes are expressed or not (all genes in the diff expression data are considered expre genes that are no in diff expression data are removed from the network) 
data(toy_network)
data(toy_signaling_input)
data(toy_metabolic_input)
data(toy_RNA)
"""
> toy_metabolic_input
Metab__HMDB0000190_c Metab__HMDB0000247_c 
2.249355             3.004581 
> toy_signaling_input
MYC      USF1       SRF 
12.167479  5.424429  6.709740 
> toy_network
source interaction                      target
1                          SND1          -1                        MGLL
2                         FGFR1           1                        LDHA
3                        MAPK14          -1                       FGFR1
4                         EPAS1           1                      SLC2A1
5                           MYC           1                      SLC2A1
6                         HIF1A           1                      SLC2A1
7                          EGR1           1                         FN1
8          Metab__HMDB0000122_c           1            Gene1338__AKR1A1
9              Gene1338__AKR1A1           1        Metab__HMDB0000247_c
10         Metab__HMDB0000131_c           1      Gene3843__orphanReacNA
11       Gene3843__orphanReacNA           1        Metab__HMDB0000126_c
12               Gene9197__MGLL           1        Metab__HMDB0000131_c
13  Gene7338__LDHB_LDHA_reverse           1        Metab__HMDB0000190_c
14     Gene9049__SLC2A1_reverse           1        Metab__HMDB0000122_c
15                         MGLL           1              Gene9197__MGLL
16                         LDHA           1 Gene7338__LDHB_LDHA_reverse
17                       SLC2A1           1    Gene9049__SLC2A1_reverse
18                       MAPK14           1                    MAPKAPK5
19                     MAPKAPK5           1                        SND1
20                          FN1          -1                      MAPK14
21         Metab__HMDB0000122_c           1            Gene1338__AKR1B1
22             Gene1338__AKR1B1           1        Metab__HMDB0000247_c
23                        MAPK1          -1                       FGFR1
24         Metab__HMDB0000247_c           1                      MAPK14
25                        MAPK1           1                    MAPKAPK5
26                       MAPK14          -1                       MAPK1
27         Metab__HMDB0000122_c           1            Gene1338__AKR7A2
28             Gene1338__AKR7A2           1        Metab__HMDB0000247_c
29                         CDK2           1                         MYC
30                        APEX1           1                       STAT3
31                       MAPK14           1                        USF1
32                       MAPK14           1                        ELK1
33                       MAPK14           1                       STAT3
34                       MAPK14           1                         JUN
35                       MAPK14           1                     CSNK2A1
36                       MAPK14           1                       NR3C1
37                         CDK2           1                       NR3C1
38                      CSNK2A1           1                      TFAP2A
39                      CSNK2A1           1                         SRF
40                      CSNK2A1           1                        AKT1
41                         CDK2           1                         SP1
42                         CDK2           1                       FOXM1
43                         AKT1           1                       NR3C1
44                         AKT1           1                        CDK2
45                      CSNK2A1           1                       APEX1
46                       MAPK14           1                        ETS1
47                       MAPK14           1                         MYC
48                      TP53BP1          -1                        E2F4
49                         AKT1           1                      SREBF1
50                         AKT1           1                         MYC
51                       MAPK14           1                         SP1
52                        APEX1           1                       EPAS1
53                       MAPK14           1                         SRF
54                       MAPK14           1                      TFAP2A
55                         AKT1           1                        ETS1
56                        NR3C1           1                        EGR1
57                         AKT1           1                       HIF1A
58                         AKT1           1                       NFKB1
59                         AKT1           1                       STAT3
60                       MAPK14           1                       NFKB1
61                      CSNK2A1           1                       NFKB1
62                         AKT1           1                         JUN
63                          SP1           1                       NFKB1
64         Metab__HMDB0000247_c           1                      MAPK14
65                         AKT1          -1                     TP53BP1
66                       MAPK14          -1                     TP53BP1
67                         AKT1          -1                       GATA2
68                         CDK2          -1                       RUNX1
69                        MAPK1           1                       HIF1A
70                       MAPK14           1                       MAPK1
71                        MAPK1           1                       STAT3
72                        MAPK1           1                        ELK1
73                        MAPK1           1                         JUN
74                        MAPK1           1                         SP1
75                        MAPK1           1                         MYC
76                        MAPK1           1                        CDK2
77                        MAPK1           1                      SREBF1
78                        MAPK1           1                     CSNK2A1
79                        MAPK1           1                        ETS1
80                        MAPK1           1                        EGR1
81                        MAPK1           1                       NFKB1
82                        MAPK3           1                       HIF1A
83                        SMAD2           1                         SP1
84                        MAPK3           1                       STAT3
85                        MAPK3           1                        ELK1
86                        MAPK3           1                       SMAD2
87                        MAPK3           1                         MYC
88                        MAPK3           1                        ETS1
89                        MAPK3           1                         JUN
90                        MAPK3           1                         SP1
91                        MAPK3           1                      SREBF1
92                        SMAD2           1                        E2F4
93                         AKT1           1                       MAPK3
94                        MAPK3           1                       NFKB1
95                        MAPK3           1                        EGR1
96                         AKT1           1                       CREB1
97                       MAPK14           1                       CREB1
98                        CREB1           1                        EGR1
99                       MAPK14           1                        ATF4
100                        ATF4           1                        EGR1
101                       MAPK1           1                       SMAD2




> toy_RNA
      WASH7P LOC100288069    LINC01128       SAMD11        NOC2L       KLHL17 
-0.084246240 -0.681892496 -0.246712414 -0.639408186  0.508905867 -0.001460263 
     PLEKHN1         HES4        ISG15         AGRN     C1orf159         SDF4 
 2.793767569 -0.281145901 -0.437533665  1.491877362  0.751798247  0.852306183 
     B3GALT6       UBE2J2        ACAP3        PUSL1       CPSF3L         CPTP 
-0.362042354  0.460715362  0.121726309  0.023146193 -0.105873805  0.474934050 
        DVL1     AURKAIP1        CCNL2    LOC148413       MRPL20       ATAD3B 
 0.965378027  0.258901863 -0.005402307  0.218012351 -0.040879242  0.968784822 
      ATAD3A        SSU72         MIB2       CDK11B     SLC35E2B       CDK11A 
 0.918022248 -0.512022150  0.019879413  0.669075509 -0.038298037  0.512046724 
     SLC35E2         NADK         GNB1        PRKCZ       FAAP20          SKI 
-0.457193695 -0.636604298  0.520148133 -1.140175599 -0.262700083  0.075864337 
        RER1        PEX10        PANK4      FAM213B     ARHGEF16        MEGF6 
 0.719567262  0.762353379 -0.300364276 -1.519591783 -1.233270702  0.793394504 
      TPRG1L       WRAP73       LRRC47       CEP104     C1orf174        NPHP4 
 0.352948165 -1.024229008  0.429785441 -0.254647303  0.481538939 -0.393657547 
       RPL22       RNF207         ICMT        ACOT7     TNFRSF25      PLEKHG5 
-0.503195513  0.487726739  0.397926304  0.575652541 -1.008506357 -1.111202553 
        NOL9       ZBTB48       KLHL21        PHF13        THAP3      DNAJC11 
 0.963926542 -0.178405110 -0.181571626 -0.500115359 -0.244554002  0.809083778 
      CAMTA1        VAMP3         PER3        PARK7       ERRFI1         RERE 
-0.463164124  0.553785734 -0.096433384 -0.035045679  0.680192540  0.313550288 
        ENO1         H6PD        SPSB1      TMEM201       PIK3CD       CLSTN1 
 0.475801306 -0.414511335  0.149079014  0.589926868  0.534604436  0.107700357 
    CTNNBIP1         LZIC       NMNAT1        UBE4B        KIF1B          PGD 
 0.411586964 -0.306839580 -1.125795307 -0.277515092 -0.179700272 -0.216083781 
      APITD1         DFFA        PEX14        CASZ1       TARDBP          SRM 
 0.004538515  0.229192488  1.073644442  0.446001640  0.186543252  0.655845911 
     EXOSC10         MTOR       UBIAD1       MAD2L2       AGTRAP        MTHFR 
 0.147525632  0.442259138  0.325205164  0.056023492 -2.159462923 -0.811690761 
       CLCN6     KIAA2013        PLOD1         MFN2         MIIP       VPS13D 
 0.365389492  0.236300918  0.353628180  0.632164197  0.135162592 -0.778324679 
       DHRS3        PRDM2         KAZN       TMEM51        EFHD2        CASP9 
-0.663655476 -0.607469668  1.429654501  1.511246459  1.592273344 -0.247707482 
     DNAJC16         DDI2       RSC1A1      PLEKHM2       UQCRHL         SPEN 
 0.363951725  0.103180340 -0.188268774  0.315181863 -0.278697029  0.666813808 
      ZBTB17        EPHA2       FBXO42        SZRD1       NECAP2        NBPF1 
 0.215681375  0.747775522 -0.650072817  0.617266149  0.647030149 -0.482776927 
     CROCCP2      ATP13A2         SDHB         RCC2    ARHGEF10L      ALDH4A1 
-0.779296845 -0.442253819 -0.080848929  0.221768615 -0.435241430 -0.147958168 
       IFFO2         UBR4         EMC1        MRTO4       AKR7A2        PQLC2 
 0.404446608  0.116150621  0.910659781  0.823771307 -0.171137982  0.289508490 
       CAPZB       MINOS1      RPS14P3         NBL1        TMCO4      CAMK2N1 
 0.893957930 -0.292002645  0.243198275  0.631113445 -0.290582146 -0.472561863 
        MUL1          CDA        PINK1     PINK1-AS        DDOST        SH2D5 
 0.811427822 -0.913784846  1.009424333 -0.424563030 -0.011095204 -0.474287164 
      HP1BP3       EIF4G3         ECE1        USP48      LDLRAD2        HSPG2 
-0.465474840  0.219179698  1.274203146 -0.317454190  0.275337643  1.617658823 
   LINC00339        CDC42       ZBTB40        EPHB2        KDM1A        LUZP1 
-1.054446931  0.627352492 -0.542981398  0.069963520  0.003238579  0.761614598 
      HNRNPR       ZNF436   ZNF436-AS1          ID3        RPL11        TCEB3 
 0.197627174 -0.518873910 -1.284529169  0.337455172 -0.038739737  0.460266381 
      PITHD1       LYPLA2         GALE        HMGCL        FUCA1        PNRC2 
 0.133870476 -0.606675857  0.462674725  0.064600757 -0.818606212 -0.347591609 
      SRSF10        STPG1        RCAN3        SRRM1        CLIC4         SYF2 
-0.096472548 -0.465391448 -0.280448560  0.487302110  0.619444847 -1.320951912 
       RSRP1      TMEM50A       TMEM57      LDLRAP1        SEPN1       MTFR1L 
-0.340825054 -0.119146098 -1.265554908  0.016930550 -0.378735918 -0.505852539 
       AUNIP        STMN1       PAFAH2       ZNF593        CEP85     SH3BGRL3 
-0.472586306 -0.637835971 -1.153495885  0.248414562 -0.067570956  0.510440735 
      UBXN11        DHDDS        HMGN2      RPS6KA1       ARID1A         PIGV 
 0.160819063  0.459335569 -0.140324156  0.280075329  0.537207318 -1.090057724 
     ZDHHC18          SFN         GPN2      GPATCH3         NUDC        TRNP1 
-0.217941953 -0.815753424  0.770097526 -0.242309533  0.078595498  0.723155653 
      SLC9A1        WDTC1      TMEM222     ACTG1P20       MAP3K6        WASF2 
 0.365891502 -0.748639371  0.623813270  1.058924440 -0.135714596  0.738367656 
       AHDC1         IFI6        STX12       PPP1R8         RPA2         XKR8 
 1.594941721 -0.544786872 -0.745300380  0.277790879 -0.138653404 -0.008054164 
        EYA3       DNAJC8       ATPIF1        SESN2        MED18      PHACTR4 
 0.407620503  0.337970421  0.177516146 -0.019391878  0.613664670  0.817175044 
       SNHG3         RCC1     SNORA73B     TRNAU1AP       SNHG12      SNORA61 
-0.562641942  0.445324141  0.276838780  0.731704813  0.386368834  0.457254237 
       TAF12        RNU11        GMEB1       YTHDF2     TMEM200B        SRSF4 
-0.173702265 -0.974287193 -0.240462334 -0.075858594 -0.736681417  0.196091423 
        MECR        PTPRU         SDC3         PUM1      SNRNP40      ZCCHC17 
-0.189535746 -0.433021349  0.213999272  0.104902771  0.107983885  0.114820685 
     SERINC2      TINAGL1         PEF1       SPOCD1       PTP4A2      KHDRBS1 
 1.016792847  0.544340872  0.867610769 -0.587334330 -0.093084355  0.590100714 
     TMEM39B        KPNA6        TXLNA      CCDC28B         IQCC      TMEM234 
 0.083181205  0.881319628 -0.236858264 -1.007581883  0.303646964  1.244861855 
       EIF3I        HDAC1     MARCKSL1        TSSK3        BSDC1      ZBTB8OS 
 0.087338956  0.087943012 -0.498481922  0.318222468 -0.412071918  0.029559035 
       RBBP4         SYNC     KIAA1522         YARS      S100PBP       TMEM54 
-0.328073329 -0.378375565  0.582984300 -0.247461355 -0.871825773  0.901179695 
      RNF19B          AK2       TRIM62       ZNF362         PHC2       SMIM12 
-0.255134025 -0.254726689  0.778938042 -0.271968440  0.014146896  0.591198411 
     ZMYM6NB        ZMYM1         SFPQ        ZMYM4    KIAA0319L         NCDN 
 0.437195309 -0.569692109  0.361518513 -0.661907209  0.409520340  0.460813275 
       PSMB2     C1orf216        CLSPN         AGO1         AGO3      ADPRHL2 
 0.817940431 -0.313538640  0.478222942  0.045372050  0.060999520  0.814444384 
     TRAPPC3       MAP7D1       THRAP3        EVA1B        STK40        LSM10 
 0.120508438  0.662143555  0.525054650  0.125192216 -0.015449834  0.193989584 
       OSCP1       MRPS15      ZC3H12A        MEAF6        SNIP1         GNL2 
-0.710181117 -0.186204986  0.283883994 -0.979802569 -0.271017484 -0.142095353 
    C1orf109        CDCA8       MANEAL         YRDC     C1orf122         MTF1 
-0.216879323  0.851260417  0.163489498 -0.340539310  0.057610124  0.699793029 
      INPP5B        SF3A3         FHL3       UTP11L        RRAGC        MYCBP 
-0.811179144  0.117360622  0.176176938 -0.630696229 -0.176653935  0.209334299 
     AKIRIN1       NDUFS5        MACF1     KIAA0754       PABPC4 LOC101929516 
-0.284022582  0.010899300  0.453467140  1.297738396  0.333621602 -0.046659708 
        PPIE        OXCT2        TRIT1       MFSD2A         CAP1         PPT1 
-1.681568087 -0.219488859 -0.329529060 -0.715180612  0.368427721 -0.560828555 
         RLF     ZMPSTE24        SMAP2         EXO5         NFYC        CTPS1 
-0.555957497 -0.182671002 -0.426685865 -0.149536927 -0.307977756 -0.177569696 
       SCMH1       HIVEP3        FOXJ3         PPCS         PPIH         YBX1 
 0.411977051 -0.583657561  0.476986247 -1.133401191 -0.217287283  0.009912460 
        P3H1      C1orf50         SVBP       ZNF691       SLC2A1     EBNA1BP2 
 0.868842528 -0.731793046 -0.322910152 -0.143775233  1.425078107 -0.582144148 
       CDC20       ELOVL1         MED8         SZT2          HYI        PTPRF 
 1.016971565  0.436084961 -0.381015170  0.660124142  0.048983453  0.934325550 
       KDM4A      ST3GAL3         ARTN        IPO13         DPH2      ATP6V0B 
-0.297079398 -0.566996431  0.747242497  0.996020388  0.396560492 -0.515052036 
     B4GALT2       CCDC24        DMAP1         ERI3       RNF220       TMEM53 
 1.195023142 -0.355974070  0.565910966  0.090255557  0.508658727 -1.252398489 
       KIF2C         RPS8       EIF2B3       HECTD3         UROD        MUTYH 
 0.017954984 -0.247997445 -0.350959203  1.234247250  0.681088329 -0.575806038 
        TOE1       MMACHC        PRDX1       AKR1A1         NASP      GPBP1L1 
-0.010659408  0.082953894  0.306030281 -0.089356959 -0.180842898  0.137563428 
   RPS15AP10       TMEM69        MAST2       TSPAN1      POMGNT1       RAD54L 
-0.178341894 -0.796631932  0.456330134 -1.224171482 -0.054144524 -0.133077830 
      LRRC41        UQCRH        NSUN4        MKNK1        MOB3C       ATPAF1 
 0.007317018 -0.497135256 -0.599558306  0.091447365 -0.688458541 -0.278974608 
     EFCAB14     PDZK1IP1         STIL        CMPK1    FOXD2-AS1         FAF1 
 0.697107740  0.151662958  0.205310090 -0.268014297 -0.820443971 -0.339128268 
      CDKN2C        RNF11        EPS15       OSBPL9         NRDC        RAB3B 
 0.645478327  0.054318102 -0.375396327  0.361319636 -0.400287394 -1.328166720 
     TXNDC12        KTI12       BTF3L4       CC2D1B         ORC1      PRPF38A 
-0.507462927 -0.417317953 -0.745190396  0.129109757  0.119847239  0.062475997 
     ZCCHC11         COA7       ZYG11B         SCP2         CPT2     C1orf123 
-0.288102934 -0.321149826 -0.745955348 -0.617109351 -0.708232931  0.303334208 
       MAGOH         LRP8         NDC1        YIPF1       HSPB11       LRRC42 
-0.096897432 -0.021605894 -0.542571684 -0.779117997  0.057751504  0.025688772 
      TMEM59       MRPL37        SSBP3         TTC4        PARS2       DHCR24 
-0.623163294  0.228640889 -0.053056422  0.494461880 -0.922106571  0.983349281 
       USP24         OMA1        MYSM1          JUN        TM2D1         USP1 
 0.087303096 -1.234522007 -0.736752355  0.884749963 -1.120551666 -0.117653488 
       DOCK7      ITGB3BP         PGM1         ROR1       RAVER2         JAK1 
-0.721613981 -0.543981454  0.569946453  1.736788231 -0.893612454  1.601186850 
         AK4       LEPROT        MIER1       SERBP1      GADD45A        GNG12 
 2.002514010 -0.372661959 -0.410646670  0.285499822  0.031667111  0.399126013 
         WLS       DEPDC1       LRRC40       SRSF11     ANKRD13C        HHLA3 
-0.938159220  0.180254964 -0.574618577 -0.056668102  0.349456673  0.705960806 
      ZRANB2         CRYZ         TYW3        ACADM       DLSTP1      RABGGTB 
-0.307059335  1.719905155  0.496116975 -1.037665932 -0.164033349 -0.556852735 
        PIGK         ZZZ3        USP33         NEXN        FUBP1       DNAJB4 
-0.479982585 -0.280248725  0.079253381 -0.366356507  0.645543870 -0.916521297 
       IFI44       ADGRL2       PRKACB         RPF1         GNG5       SSX2IP 
-1.056016976  0.450141949 -0.448678216 -0.509315599 -0.176600893 -0.715987977 
     C1orf52        BCL10        DDAH1        CYR61       ZNHIT6      SH3GLB1 
 0.408665098  0.285654160 -0.027716927  0.433371203  0.761188323  0.181967451 
       SEP15       HS2ST1         LMO4         PKN2        GTF2B       RBMXL1 
-0.445262576 -0.193997400  0.370942016  0.068619960 -0.637357187  0.103629007 
        GBP3         GBP1       LRRC8D       ZNF326       ZNF644         CDC7 
 0.453161141 -0.360832818 -0.269246136  0.752806239 -0.370607284 -0.174879974 
      SETP18        RPAP2         RPL5       FAM69A         MTF2        TMED5 
 0.539062441 -1.264472347 -0.016857236 -0.863383689 -0.269313271 -0.178134578 
      CCDC18          DR1       FNBP1L        BCAR3      DNTTIP2         GCLM 
-0.514242316 -0.188187217  0.281760279  0.417397153  0.443844674  0.185372121 
    ARHGAP29        ABCD3           F3         CNN3        ALG14       TMEM56 
 0.214254444  0.024712729 -1.086677397  0.608666268  0.292740646 -0.818621170 
       RWDD3        PTBP2         SNX7      MFSD14A         RTCA        EXTL2 
-0.618755347 -0.493640287  0.119709672 -0.251593636 -0.155816148 -1.133955374 
     SLC30A7         DPH5 LOC102606465        S1PR1      ACTG1P4        PRMT6 
-0.652692005  0.208126731 -0.121319230  0.033588440  1.391672389  0.564241183 
    SLC25A24      PRPF38B       STXBP3        GPSM2        CLCC1     TMEM167B 
-0.252322526 -0.006687389 -0.952089453 -0.147580036 -0.540613859 -0.988650169 
     SCARNA2         SARS       CELSR2        PSRC1        SORT1        PSMA5 
 0.903942874 -0.445993485 -0.465652959  0.451455468 -0.825900328 -0.022001373 
    CYB561D1        GNAI3        AMPD2        GSTM4        GSTM3         CSF1 
-1.168092802  0.857821840  1.796949012 -0.653006874 -0.145058610  1.734571465 
      AHCYL1       STRIP1        KCNC4        RBM15      LAMTOR5        LRIF1 
 0.261791256  0.438457799 -0.264020251  1.128950528  0.009125206 -1.554228087 
       DRAM2        CEPT1        WDR77       ATP5F1        RAP1A        DDX20 
-0.490821921 -0.329137793  0.603309867  0.086873152 -0.685369168 -0.218466070 
   CTTNBP2NL       CAPZA1        MOV10         RHOC      SLC16A1 LOC100506392 
 0.154921933  0.316093698  0.590668446  0.571538305  0.305292379 -0.455694354 
       LRIG2        MAGI3        PHTF1        AP4B1      DCLRE1B        HIPK1 
-1.187714045 -0.909622775 -0.917863708 -0.115150170  0.822658145  0.488061791 
      TRIM33        BCAS2         NRAS        CSDE1        SIKE1       VANGL1 
-0.129483242 -0.144228461  0.848756236 -0.019766923  0.164403960  1.319481249 
      ATP1A1   ATP1A1-AS1         CD58        IGSF3       PTGFRN         TTF2 
-0.499809438 -0.195833571  0.402733266  0.731853497  0.917798616 -0.073607661 
      MAN1A2        GDAP2         WDR3        WARS2 LOC101929147       ZNF697 
-0.462399426 -0.701988569 -0.163346237  0.233631496 -0.387650861 -1.027226636 
      NOTCH2       FAM72B    HIST2H2BA      SRGAP2B      PPIAL4G       PFN1P2 
 0.987741760 -0.612145723  0.174589713  0.119492074  0.237005216  1.079740844 
       NBPF9      PDE4DIP       SEC22B     NOTCH2NL        TXNIP      POLR3GL 
-0.920745266 -1.134112010 -0.208568478  0.699629634 -1.302743006 -0.242556867 
       LIX1L        RBM8A       PEX11B        PIAS3       POLR3C       RNF115 
-0.688240847 -0.185344642 -0.408851777 -0.107271871  0.383606845  0.618769304 
      GPR89A       PRKAB2      PDIA3P1        CHD1L         BCL9         ACP6 
 0.150091717 -0.742190253  1.094925045 -0.716283519  0.467445227 -0.466036022 
      GPR89B       NBPF15    LOC645166      PPIAL4A    HIST2H2BF     HIST2H3D 
-0.254862134 -0.208635162  0.309538714 -0.506388137  0.513511481  0.334772959 
    HIST2H4A     HIST2H3A   HIST2H2AA4    HIST2H2BC   HIST2H2AA3     HIST2H3C 
 0.599963325  0.392911190  0.449724094 -0.141037092  0.479925490  0.418976406 
    HIST2H4B    HIST2H2BE    HIST2H2AC    HIST2H2AB        SF3B4       OTUD7B 
 0.729421463  0.346527597  0.404126213  0.109120193  0.134813469 -0.709819945 
       VPS45      PLEKHO1       ANP32E        APH1A        CIART       MRPS21 
-0.464054214  0.049449785  0.072526932 -0.264135076 -0.108720503 -0.986129962 
       PRPF3        RPRD2        TARS2         MCL1         ENSA      GOLPH3L 
-0.282580049 -0.596586139 -0.773682777 -0.373476419 -1.059864186 -0.579444340 
        ARNT       SETDB1        CERS2        PRUNE      C1orf56     CDC42SE1 
-0.519155388  0.260170335 -0.365154912 -1.005732238 -1.300642823 -0.421805147 
      MLLT11       GABPB2       LYSMD1        SCNM1        VPS72      PIP5K1A 
-1.290768649 -0.835633254 -0.958717031 -0.341617513 -0.831153493  0.008913138 
       PSMD4       ZNF687        PI4KB         RFX5        PSMB4         POGZ 
-0.356994158 -0.089774474 -0.524219233 -0.805792969 -0.422066731 -0.246305221 
       TUFT1        SNX27        MRPL9        TDRKH      S100A10      S100A11 
-0.400448562 -0.279009785 -0.226942668 -1.075255470  0.030831850  0.547709232 
      S100A6       S100A3       S100A2      S100A16      S100A13        CHTOP 
-0.035020407 -0.549597911  1.438596446  0.074923107  0.159797271 -0.544271329 
      SNAPIN         ILF2        INTS3      GATAD2B      DENND4B        CRTC2 
-1.195403872 -0.190223341 -0.775752657 -0.548439110  0.119563769 -0.086556883 
     SLC39A1          JTB        RAB13        RPS27         TPM3      C1orf43 
 0.478473343 -0.682382707  0.254518798 -0.696260909  0.002942492 -1.272445856 
      UBAP2L         HAX1       ATP8B2       UBE2Q1         ADAR         PMVK 
-0.064781643 -0.827760338 -1.024146891 -1.600480243  0.193337013 -0.908371595 
      PBXIP1        PYGO2         SHC1        CKS1B        FLAD1       ZBTB7B 
-1.639716280 -1.109448129 -0.638083010 -0.261626559 -0.784171921 -0.282461471 
LOC100505666       ADAM15        EFNA4        EFNA1      SLC50A1         DPM3 
-0.728943095  0.193671283 -0.035073993 -0.764601082 -1.130646196 -1.456588140 
     KRTCAP2         MUC1         MTX1        GBAP1          GBA      FAM189B 
-0.458427753 -1.007981366 -0.436516910 -0.924969048 -0.737233477 -0.647743599 
      SCAMP3         CLK2         HCN3         FDPS    RUSC1-AS1        RUSC1 
-0.887659319 -0.456846129 -0.385926128 -1.077047336 -0.671513812  0.493121219 
       ASH1L        MSTO1       YY1AP1         DAP3       MSTO2P        GON4L 
 0.037476594  0.223275598 -0.396912002 -0.707956416  0.343623120 -0.310372284 
        RIT1     KIAA0907      ARHGEF2         SSR2       UBQLN4      LAMTOR2 
-0.683452915 -0.831215652 -1.585868131 -0.357148235 -0.342909090 -0.794863217 
        LMNA     SLC25A44         PMF1         SMG5       TMEM79         CCT3 
-0.039565198 -0.014284788 -0.158373281  0.275197557 -0.367981380 -0.116184900 
       MEF2D       IQGAP3      APOA1BP      GPATCH4       CRABP2      ISG20L2 
-0.896144277 -0.067833419 -0.871539507  0.149194664 -0.353526193 -0.326783261 
      RRNAD1       MRPL24         HDGF         PRCC     ARHGEF11         ETV3 
-1.168186894  0.356178524  0.112354736 -0.365697729 -0.511539802 -0.576521758 
      KIRREL        IFI16       DUSP23       TAGLN2        IGSF8    LOC729867 
 1.089539175 -1.028875681 -0.178430248  0.633746198 -0.145917615 -0.752042793 
       PEA15        DCAF8        PEX19         COPA      SUMO1P3        NCSTN 
 0.338163600 -0.131086950 -0.329433825 -0.223462503 -0.249379309  0.123505251 
        F11R         USF1        PFDN2         NIT1         DEDD         UFC1 
-0.133876316 -0.504962057 -0.567641168 -0.667792965 -0.418124106 -0.920948575 
       USP21         PPOX      B4GALT3       NDUFS2      TOMM40L         SDHC 
-0.711713442 -0.878494446 -0.506210775 -1.030567929 -1.239410171 -0.514536533 
      DUSP12         ATF6        UHMK1         UAP1      HSD17B7         NUF2 
-0.181144970 -0.724018133  0.381055784 -0.384545966 -0.174430294 -0.614365864 
       MGST3      ALDH9A1        TMCO1         UCK2         POGK        TADA1 
-1.819161327 -0.780782002 -0.825369899 -0.253178891 -0.183647108 -0.684687699 
      POU2F1        CREG1        MPZL1         MPC2        DCAF6       GPR161 
 0.038963852 -0.557163361  0.338184036 -0.663615810  0.033529828 -1.379756505 
       TIPRL       SFT2D2   ANKRD36BP1       ATP1B1         NME7        BLZF1 
-0.511507283 -0.046342005  0.069454977  0.114349760  0.077177689 -0.904098344 
    C1orf112       PRRC2C      METTL13         PIGC         SUCO        PRDX6 
-0.850582726  0.447420747  0.200136858 -0.806512260 -0.810275398 -0.711387797 
      KLHL20        CENPL        DARS2         GAS5       ZBTB37        RC3H1 
-0.752704594  0.155996811 -0.220572582 -0.910528670 -1.256381993  0.752250565 
    RABGAP1L       CACYBP       MRPS14        RFWD2       RASAL2       FAM20B 
-0.835332483 -0.122699919 -0.918197103 -0.617070445  0.322442651 -0.138160848 
       TOR3A         ABL2        SOAT1     TOR1AIP2     TOR1AIP1       CEP350 
-0.378966270 -0.117797844 -0.844499355 -0.541176405 -0.405901794 -0.804380494 
       QSOX1        ACBD6         XPR1         STX6         IER5         DHX9 
 0.144325853 -0.085585574 -1.353193417 -0.967851218  0.009131743  0.044957014 
       LAMC1        LAMC2         SMG7        ARPC5       TSEN15        EDEM3 
 0.569594465  0.631942339 -0.438881814 -0.994041229 -0.111672001 -1.193086468 
     FAM129A         RNF2     IVNS1ABP          TPR      C1orf27         RGS2 
 0.250021488  0.071031143 -0.881534129 -0.173773114 -1.271162637 -0.253485125 
       UCHL5       TROVE2        GLRX2        CDC73         ASPM         NEK7 
-0.246577623 -0.542783337 -0.639218199 -1.004933699  0.271438949 -1.178722794 
      ZNF281        KIF14      CAMSAP2        TMEM9       PHLDA3        CSRP1 
-0.058846431 -0.475031905 -0.650673735  0.862114532 -0.317964780 -0.095674335 
     RPS10P7         NAV1         IPO9       SHISA4      TIMM17A        RNPEP 
 0.479373518  0.645572279  0.062773514 -0.733926762 -0.529461489 -0.377379745 
        ELF3        ARL8A        UBE2T        KDM5B        RABIF       KLHL12 
-0.177702005 -0.609995150 -0.723821157 -1.410559480 -1.292406995 -0.239675515 
     ADIPOR1       CYB5R1     TMEM183B       ADORA1       ATP2B4      ZC3H11A 
-0.507215897 -1.000939912  0.042268191  0.674413657  1.215812834 -0.969817704 
       ZBED6        SNRPE        SOX13      PLEKHA6     PPP1R15B         MDM4 
-0.804851219 -0.201519956 -1.294829135 -1.413987450  0.261311011 -1.144786169 
       RBBP5        DSTYK        NUAK2        CDK18         ELK4       NUCKS1 
-0.430731749 -1.006008125 -0.087634779  0.799858734  0.062586552  0.255020381 
       RAB29      SLC41A1       SRGAP2        IKBKE        EIF2D        DYRK3 
-0.983600895  0.692678360  0.498355933  0.414880620  0.097924282 -1.192165510 
    MAPKAPK2     C1orf116         YOD1         CD55         CD46        LAMB3 
 0.533246602 -0.091420892 -0.291599559 -0.851932108 -0.547425064  0.715935540 
        G0S2        DIEXF  SERTAD4-AS1        RCOR3    LINC00467      SLC30A1 
 0.943391500 -1.276084069 -1.238032745 -0.030003420 -0.228465273 -0.088041238 
        NEK2       LPGAT1        INTS7          DTL      PPP2R5A      TMEM206 
 0.013223932 -0.430433885 -0.315741108 -0.207861042 -0.642045769 -0.946519352 
        NENF         NSL1   FLVCR1-AS1       FLVCR1      RPS6KC1        SMYD2 
-0.376717149 -1.262935146  0.074349783 -0.562225008 -0.939682522 -0.199366421 
      PTPN14        CENPF        KCTD3      GPATCH2        RRP15        TGFB2 
 1.908456795  0.180521026 -0.366846470 -0.117237414 -0.771110535  0.905583442 
     LYPLAL1         EPRS        BPNT1        IARS2     RAB3GAP2          HLX 
-1.102733838 -0.637792817 -0.983326337 -0.199181104 -1.119013601 -1.365277789 
      DUSP10         MIA3         AIDA         BROX        CAPN2      TP53BP2 
 0.197558166 -0.130566994  0.518306204 -0.365823898  0.293485362  0.624819921 
      FBXO28        DEGS1          NVL        CNIH4        WDR26          LBR 
-0.035018647  0.173784161 -0.502913833  0.545436390 -0.265037207 -0.482570716 
        ENAH         SRP9        EPHX1      TMEM63A        PYCR2         SDE2 
 0.493487446 -0.966611704 -0.305495127 -0.885466944 -0.315752655 -1.255704772 
     H3F3AP4        ACBD3        PARP1        PSEN2     CDC42BPA LOC100130093 
-1.016214711 -0.184265849 -0.526478761 -0.950245432 -1.140492534 -0.906273393 
       JMJD4       SNAP47         ARF1      C1orf35       MRPL55         GUK1 
 0.062297829  0.179038721  0.022236216  0.270334315  0.285877433  0.463317269 
      TRIM11     HIST3H2A       RNF187        RAB4A        CCSAP        ACTA1 
-0.276077821 -1.433833249 -0.270349238 -0.793520924 -1.048757161  1.757566225 
      NUP133        TAF5L         URB2       GALNT2         COG2     C1orf198 
-0.545104888  0.500543252  0.106423189  0.238508842 -0.874463294  0.619455680 
        ARV1       FAM89A     C1orf131        GNPAT        EXOC8        SPRTN 
-0.964327270 -0.734720324 -0.574309482 -0.185508259 -0.827111929 -0.838348664 
       EGLN1        TSNAX      SIPA1L2        NTPCR     KIAA1804         COA6 
-0.927905258 -0.813549664 -0.395280659 -0.002194069  0.887397685 -0.785906708 
     IRF2BP2       TOMM20        RBM34       ARID4B        GGPS1         TBCE 
-0.692872183 -0.317388799 -1.059741144 -0.969131479 -0.886323395 -0.645423703 
    B3GALNT2         GNG4      GPR137B      EDARADD       LGALS8       HEATR1 
 1.033447155  0.683145454 -0.920530287  1.012546289 -0.254343586  0.084378512 
         MTR LOC100130331           FH         OPN3         CHML         EXO1 
 0.249700575  2.081493636 -0.486147529  0.175056541 -0.142799382 -0.091584638 
      CEP170         AKT3       ZBTB18         ADSS        DESI2        COX20 
-0.508026819 -0.794360780  0.904001586 -0.867073472 -0.369397544 -0.780694352 
  HNRNPU-AS1       HNRNPU        SMYD3        TFB2M       SCCPDH       AHCTF1 
-0.805387371  0.214179971 -0.404069729 -0.474367176 -0.439016494 -0.439728313 
      ZNF695       ZNF124       ZNF496      SH3BP5L       ZNF672       ZNF692 
-1.080065623  0.006372691  0.205425163 -0.137742463 -0.066583477 -1.011262267 
        ACP1       TMEM18        TSSC1     TRAPPC12         ADI1      RNASEH1 
-0.186542197 -0.018254655 -0.224647476  0.124837980 -1.007099017  0.423596387 
 RNASEH1-AS1         RPS7          ID2    KIDINS220       MBOAT2        ASAP2 
 0.490926777 -0.778411010  0.504431689 -0.305803106 -0.026184458  0.461394400 
    ITGB1BP1        CPSF3         IAH1       ADAM17        YWHAQ        TAF1B 
 0.278828732 -0.104565271  0.215881326 -0.214691345 -0.061792479 -0.183089549 
       KLF11         RRM2       HPCAL1         ODC1        NOL10     ATP6V1C2 
 0.068589497 -0.249360223  0.148906783  0.152968881  0.065579460  0.044200983 
       PDIA6        PQLC3        ROCK2         E2F6 
-0.213857346 -0.252384809 -0.430524031 -1.135771639 
 [ reached getOption() -- omitted 8300 entries ]
"""
test_for <- preprocess_COSMOS_signaling_to_metabolism(meta_network = toy_network, 
                                                      signaling_data = toy_signaling_input,
                                                      metabolic_data = toy_metabolic_input, 
                                                      diff_expression_data = toy_RNA, 
                                                      maximum_network_depth = 15, 
                                                      remove_unexpressed_nodes = TRUE, 
                                                      CARNIVAL_options = CARNIVAL_options
                                                      )