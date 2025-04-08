PGDMP     4    ;                s            postgres    9.3.5    9.3.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    18373 	   northwind    SCHEMA        CREATE SCHEMA northwind;
    DROP SCHEMA northwind;
             postgres    false            �            1259    18407 
   categories    TABLE     �   CREATE TABLE categories (
    categoryid integer NOT NULL,
    categoryname character varying(50),
    description character varying(100)
);
 !   DROP TABLE northwind.categories;
    	   northwind         postgres    false    7            �            1259    18410 	   customers    TABLE     �  CREATE TABLE customers (
    customerid character varying(5) NOT NULL,
    companyname character varying(50),
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(50),
    city character varying(20),
    region character varying(15),
    postalcode character varying(9),
    country character varying(15),
    phone character varying(17),
    fax character varying(17)
);
     DROP TABLE northwind.customers;
    	   northwind         postgres    false    7            �            1259    18401 	   employees    TABLE     A  CREATE TABLE employees (
    employeeid integer NOT NULL,
    lastname character varying(10),
    firstname character varying(10),
    title character varying(25),
    titleofcourtesy character varying(5),
    birthdate timestamp without time zone,
    hiredate timestamp without time zone,
    address character varying(50),
    city character varying(20),
    region character varying(2),
    postalcode character varying(9),
    country character varying(15),
    homephone character varying(14),
    extension character varying(4),
    reportsto integer,
    notes text
);
     DROP TABLE northwind.employees;
    	   northwind         postgres    false    7            �            1259    18413    order_details    TABLE     �   CREATE TABLE order_details (
    orderid integer NOT NULL,
    productid integer NOT NULL,
    unitprice numeric(13,4),
    quantity smallint,
    discount numeric(10,4)
);
 $   DROP TABLE northwind.order_details;
    	   northwind         postgres    false    7            �            1259    18416    orders    TABLE     "  CREATE TABLE orders (
    orderid integer NOT NULL,
    customerid character varying(5) NOT NULL,
    employeeid integer NOT NULL,
    orderdate timestamp without time zone,
    requireddate timestamp without time zone,
    shippeddate timestamp without time zone,
    freight numeric(15,4),
    shipname character varying(35),
    shipaddress character varying(50),
    shipcity character varying(15),
    shipregion character varying(15),
    shippostalcode character varying(9),
    shipcountry character varying(15),
    shipperid integer
);
    DROP TABLE northwind.orders;
    	   northwind         postgres    false    7            �            1259    18419    products    TABLE     c  CREATE TABLE products (
    productid integer NOT NULL,
    productname character varying(35),
    supplierid integer NOT NULL,
    categoryid integer NOT NULL,
    quantityperunit character varying(20),
    unitprice numeric(13,4),
    unitsinstock smallint,
    unitsonorder smallint,
    reorderlevel smallint,
    discontinued character varying(1)
);
    DROP TABLE northwind.products;
    	   northwind         postgres    false    7            �            1259    18422    shippers    TABLE     �   CREATE TABLE shippers (
    shipperid integer NOT NULL,
    companyname character varying(20),
    phone character varying(14)
);
    DROP TABLE northwind.shippers;
    	   northwind         postgres    false    7            �            1259    18425 	   suppliers    TABLE     �  CREATE TABLE suppliers (
    supplierid integer NOT NULL,
    companyname character varying(50),
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(50),
    city character varying(20),
    region character varying(15),
    postalcode character varying(8),
    country character varying(15),
    phone character varying(15),
    fax character varying(15),
    homepage character varying(100)
);
     DROP TABLE northwind.suppliers;
    	   northwind         postgres    false    7            �          0    18407 
   categories 
   TABLE DATA               D   COPY categories (categoryid, categoryname, description) FROM stdin;
 	   northwind       postgres    false    180   d$       �          0    18410 	   customers 
   TABLE DATA               �   COPY customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) FROM stdin;
 	   northwind       postgres    false    181   J%       �          0    18401 	   employees 
   TABLE DATA               �   COPY employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, reportsto, notes) FROM stdin;
 	   northwind       postgres    false    179   �<       �          0    18413    order_details 
   TABLE DATA               S   COPY order_details (orderid, productid, unitprice, quantity, discount) FROM stdin;
 	   northwind       postgres    false    182   SC       �          0    18416    orders 
   TABLE DATA               �   COPY orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry, shipperid) FROM stdin;
 	   northwind       postgres    false    183   �l       �          0    18419    products 
   TABLE DATA               �   COPY products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) FROM stdin;
 	   northwind       postgres    false    184   �       �          0    18422    shippers 
   TABLE DATA               :   COPY shippers (shipperid, companyname, phone) FROM stdin;
 	   northwind       postgres    false    185   ��       �          0    18425 	   suppliers 
   TABLE DATA               �   COPY suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) FROM stdin;
 	   northwind       postgres    false    186   ��       X           2606    18433    categories_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);
 G   ALTER TABLE ONLY northwind.categories DROP CONSTRAINT categories_pkey;
    	   northwind         postgres    false    180    180            Z           2606    18435    customers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 E   ALTER TABLE ONLY northwind.customers DROP CONSTRAINT customers_pkey;
    	   northwind         postgres    false    181    181            V           2606    18437    employees_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);
 E   ALTER TABLE ONLY northwind.employees DROP CONSTRAINT employees_pkey;
    	   northwind         postgres    false    179    179            \           2606    18439    order_details_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (orderid, productid);
 M   ALTER TABLE ONLY northwind.order_details DROP CONSTRAINT order_details_pkey;
    	   northwind         postgres    false    182    182    182            ^           2606    18441    orders_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 ?   ALTER TABLE ONLY northwind.orders DROP CONSTRAINT orders_pkey;
    	   northwind         postgres    false    183    183            `           2606    18443    products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 C   ALTER TABLE ONLY northwind.products DROP CONSTRAINT products_pkey;
    	   northwind         postgres    false    184    184            b           2606    18445    shippers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (shipperid);
 C   ALTER TABLE ONLY northwind.shippers DROP CONSTRAINT shippers_pkey;
    	   northwind         postgres    false    185    185            d           2606    18447    supplier_pk 
   CONSTRAINT     T   ALTER TABLE ONLY suppliers
    ADD CONSTRAINT supplier_pk PRIMARY KEY (supplierid);
 B   ALTER TABLE ONLY northwind.suppliers DROP CONSTRAINT supplier_pk;
    	   northwind         postgres    false    186    186            �   �   x�%O�n1���	��;�S� Y�(6�g$��� _�3��HJz����ҡL�GI���c� W܀�9G�|-r7h�^WӄPS�J#T!U�|0k���ᣀ��79YA.R�[�q�H�-ؒa�J��[8e���Yiף�*Nck�G{�&�A?�ݗv�r��`aA�S�}��n��L����?Gp��It_t O������S���n�s�B�e�      �      x��Zˎ#�u]�" �Ф��X&U��S$�J3�M��"s�̤����J�~��cY3�� C0���?�/�$+Y�6�����#�ƍ{�=�F:�Θ~��?��J>a�t)�')b~��,���@����Yf��sf�<-$���E*�� ��?�QD�]���韸�2YK�b)�7�n��۶]�4ۺڵ`�&,������(��N�r)�I�_�ZFtu�6z�eʂ�R4�R�H�Vgy�Z��bn��Z�_�E�ۍ��<d��:Hz���X���k�U��S�I&|�`�	������W�棣=���La67L�kӛo�7}����`2��� M�x���wI��:ي��a�^�TD2���faD�%���^�|���'�2�i��@�z{��{�����\��*Cǵ�Z�3����LW&�x��|��s�Z������Q��`�c|��<IՏ�}�Ǐ~Xɘs���Hb�odʴ��v�M��R�L���ܴ�c_��Z��ÚH�")y[F�F�2â�
[	b�;n�4�%��n�ؔ8^�pKF8��9�V�[�0����g9���7,L>�19�(#�;&���Se�F���^���[a.E�1�P�����"�������)��͓"])s\M�pK/$󼆣5t�a�k����m֤���e�@߆K֌4A�e4wNa�i��b�2[��A�����*��L�%�kx�ӝc��_���{���׹�c�a g$1��V�=Vԗ�p-��D��QA���L���'�2�d�4�nj�wZ��7�a�K�\�l6`�<O��vB��K�f��1�����x�D1$ʥ�M>�ĳ�0��h�l��5[lf�po`���Ѭ* ��
��f�5?`I��	2�.� *���4_%� /�tQd���ng�)��B�VК�üE^d��]���^�l,�4\ w��v������и%�4�n�&k�%|�.���Z�{�dL�k��v��灅���:�Y��'|� ����n�\��(71� j-D��J�OC�̷�r5B�7���;84}�<�Ƙ���h<%�zVH8u�p7���G2���;Q�r���N��r���:a~�i$ ^�eu�ul�V>]g��&�p�0M�X.��	�%99:��#��=�<�p��TE�N}�U�k��Z�LM�X�eb:[��C��'v,�4`8�cT�$8��GKx���4y���V���rK�<�>�@R�@>��W���t���ĞaPڟ����oO�V��S�T��Q�_"�t���y���Z�(�L��r�Qlu��64����5}^+�m�2�Z�~���.�� �S�bo?���1O�X7�q_��ƿ/�S$,S�:��
~˪ଥ5��E<^��[�S~GP툉N�r��p\�X��M��6�Q���Yu�d�;7��N�߭M�5k�	�{'o��j�&	E(H5*�;eUH�^�q��D�y*��=�E)���a����M0� �ml��s-`ƭ�8\�z�B����!���W��BT�ڻ��=[E�Mw:����o�i�B�.6ɉu-��b��6�k�r��I�%_uT1�,Dz�d�sY�L�m%�-nY�CzǬݠ�ނ f3�Bޒ���I�5Ap��xu�u�&���r|���"d�S���J�(�NC��ʵK��FdȆ'�5"���dv���I�^�����?�ybb	Jk�����F��ʳ�/�)��Ӯ�J;ڃI0�){62F������o^Ao�I��|������;>%�����&��7���8<][����]�V9��P���:���b�����U&�$y��?il�A�\kj�i��u���Q��E]A��;�!qJ��f�ߢ�Zl�Zr,���"u�n��go<_c���n����M���Kx��Q'�ܰT�JL���]�����' x��T��"�78�A?g�$6c�JD�p��U7l[ص۠�i�[ܼ�+��,�C�����6a�e���$�أЉ+;1�yD��-`D�?��rM�.$(�2
A����毹��ܲ��H�ݎڣ)�M�l�PFIБu;`�����eх}����`B�$��ærO�U���9P2�Y�Ȃ�����i��`�}
�$�SA�Tt�ߠ�Jq���2b� <��v�3���:up���ēN��S)h��|�$�#�ew�3�ϧ��RI�w��5���He;��o�|��Lv|����#� &�&M'�^;�~P�S�MJ�@�e
z#�c������{	U�}��D���䌵o���`�� �4���Y7|[?������D�q��%ȂW���W0��͒�v���V&�e_q��'�9o8��p�T]5_�v���F��.�����E��P�1ݟ���uH�SRF( �㏧I1�d���W7m���d2�
,���~V��#��Mȟ� 1S��޶�]�@�Z�K��w�;d;��U��&0��H�]�9��[I�� � >Ƕ���aL���DŐg�ob��\�24L�QF�NF��#DQ}��9�$Y��;���'��ߥ��?%k�0Xd�X�����t��Rqs�G�i�BƬu��`ƺ�bF3^�߅��l�j)�0xt���q�9�(�Vx���B�O��?�J�xd��*I��	(�z�ΰ�z���U��;���`U;l�xݏ�UD1���#��I��x~����*��ا��|����D��/?�9إ�zm�`��,�J!#ND�-�чN�&;�7*�DTT)u�J)5��
l����톮ÎA�%;�"'�!AJ��*�'I�x�Ѻ*�A������@{R�Fl��czejGo�n��������mR�a��mE9]�!��9�$u�c6̨�Eѽ�cu02>�T׋=q�{0o�����J�y*����s/��{�^H�2')�q)A^߇!t��]�.�3R�X3���ze��2v�S"��I}ǯÀK:w�)��5"&�T�i�K6�1��!����@���1I2�d�OpE4�ZQ�mx����aپg����a6%�-Ǉ|
U�D��b�^e]�\�}��9�!,a��?`-,���B�~�B�7U��ޘ��i��e2](�#�&�@6|_�G�+��L��׽H���*�TI�t��4PGV�'�k �ik^�����A����5l�GmF�u�����w���+���mk�bSv���4[p�n�|t?s����@�E0�L�j@ʴ�S׍��7���agL�Tf`K|��͙��G"E�ݣ��<�:+�s��p��
�U�0t�M��m׬˩�[�^p��` �"A&a�`�a�G�d�l����~�L��/
��PH��,���V���HK3�Hϗ:L�N۸����|��A��|R��"o���u�%�6�w3-��l6뺎]hJT�b˾ш�h:�Q���W�&�=6��@\6neV��M��,��*Pb�����u'�]l,�/��!T�C�t�MU��8[֎�h2��!�&�B�p�9)K�*��t*�&�򷅄��ˋ������价G	 �V�mj�Q��H�iJ� ���i#��R4ط{ꮐ�Z�V���������ܳ=�s<�.½��77Meݩ�	Y4�Gl-�#�n���J�0�lAIG�~�h�p-�NAh����%�5̂���B凯�'V�Y���yp�l���Q���A�⇌��lC�i����IDunq<[�딆ǐ0Q #��Κ暕�0�4ñ,��#}kc��)�*��l�G��D[,i�����y5�����j���Jk���7Q\¦뱠��-�aZ�h8���uk�Τ�b� ��{�q/T�d!��ۂhJ��
�_�m8���y��b֯���7Go�������w[���(Q��$n�3����Ρq��2�"���E�N���5�؎Q��+�6�t�]6F0-d&x7���!��	�S5R��H�/�C�	��i����c���2pm�m��A�0-��w����\��xP�s�hb��W%��d�ç��r*>r���f��_w\� G  �n�ۨ��dOg�!8P?ւ�ie�/P��"Z'W�2@���.����>r��J��s�Ao�;��/��m��z�Ӂ\G����U;����?���%"��X>�h�h����[Am�ڧ�^*�I0lݱ�jM�R
l�B_�y�N&ү�:�@���92�vzC�E i���r���٬c���bC!����zŉB�m��ELOw� �r*�)3�t��l8 K�aՑS��?�2;�j��-��D�V!�rBR�q �?���YU�[� �D"&���Vy'zҀ�⪅dT��mp���\5 W0A�/TnKL�P�&P���@g��;ȴM�d'b���ȍ�M�,���K�*�a����X��/�1i6��:��.�o1*��a�3����/��t����#2�Gz�Y�
$&�A�[V������8���vJ���F镼�NP=H��e�ҳ��[�UG�V���-	U������L=�PDOT��bա�5j�Fl�߶"]�z�(��8�z�ď�6�%�@��k�Ŝ� s�e]ԣ$?�B9��&���:�ϴxz"�ӏ�����6���X7�S�A��iɴ�ЙRK�7�XY������^A��rK}r�.����2���t�[��#fW��@��ԧ���YČ�CUg>�(�A��nEQ����r�Sc�����༏��7�2�@�����;tm½܆WǝV;��u��񤏵:C��*�t�}�+j���$Ɗ/x�s�C܆m�)��1 e:�w'0V����h�l��X�B#��8[��e��o}?n�HL~!OB)�g��2�����Y���б�6�O��bG�矶��z�TTR3-[J����<��T�3�6
`	� bF���Pq���*Th�S ����k��N��fk: Y��I:a�>�$�� ?ɧ'�	��Q��d��V5"�/U��P�)[5e+��N�`����ɂ�*o�(C��� H�F�~�ȩ�6c6$�q.Ks������y�i�Y�� �d���NN��C������QfWV�/�α���w<#uw<��*5ް�|[7l�tm;���'�{:["F�/�t(� ^Q�^$Q_>�r�T�������z��j�R���Cw�k[E=`�)�JC�Du�K��앞~���w4,��)���^��<���,�ԝ�ؗ�;����w2�cK�����]�G��m�@��xn�Ӎ�Fj����#�B°����]����t؃@xGߣr�⌕����p0݊UF���+A��m�u�`ɣ�v�F�A�A�б*]'Mna�nk�Q�e��� �
�N�(zӭ8=tU���]D���%��NP�zt:j[ϩ\��sؙ�g�t��Ie�������\	�$��B�|��G��\�HЪp�m�z�$�i zu�p��Z�=�v�N��`(=��+��6��*�H~%
����@����4����P�f"X&�}���ڴ�I��`2�c�� XʝL7���%��d�]e5t0�y�M�����)}���M�X�=��� �_/k��~�������e^��#�F9�ӛ7!v< ��Z
-����.P����[�PH�x��\>�"���� �"0�y�	�pcj6�C���s:=7qM��A�O���'0,�r��w���d�~��
�i�C&��o�A~Of�"S�Fn!��0ި*g��W\�����[��=������	9�N|/K���%;�=5�2�s�8�_D~ђ&ς;�Hv��i7�G��&���2˨��ZueT�7�.X�S*���*�n�(y|�#���
ʎ���Y���sþd�V��iuMs-jz��ɶ��F�V�?�%/      �   �  x��W�r۸|��b�ON��)R�}�/��Z9.�9~�LB"N(@���������I%�a,�勭�ߥɷb!+Uӽ�8U+��/J��H��tҏ��`B���/֦X���x���ԧd�K����n�'3�����X(�}���LL'q����8O�O�eY:��"KGc�����q�5�M^5��t9�O���yi+�����5]������*�a�������x:DD�R��jK�]o*�UAgX�9OvI�SЕ���(�A�]���r����گ����&�(����?��RN�L�ԫ����D] �
��k�@f -���S �o�_���m��=ʭx�H_����t��a
��wi�S�����Â�V.׈آ��4�yWF���Ë�Z���k�j�f� (�@L�m�I��(�mY5�7/����p�W\DK���EM��[KӾ�?�2�#�%i�$��:H�I�^�R�̥��.�+��s�I�H�%�6��M/��f�
�߾��s�%6�M��	��Y[�p̚c���^>W�)lh5NW�ܽw�b�!l���^������7�I��ڂF>�ŭ�����+�ѐ�3�**=*�q�������e�RD�/�~VȪ��`8<��0���a��$CTN.T��S���K�ֵw]=^�ڣnQO�Z):�.�O]����PR��g8�zA���5�]Z�2�R3��9b���J�8�^(�CQ������R9TP�zvo��z��S(����6V�}H������������4��8ͽ*��݃��#!;��`�Y<��]*,��xcV��K�4�$}���Mn]��!��S[�P�l_�3�$X[��o� ���
���G��?��+���Anq�o�K.5�X����ƷO�t�Y��ݾ���❉�&/���qXl8�d<����A?���Y:��鋮*Ѧ�Ƹx�i��^��K����t�N�9� �=�v��X4��.���Zw����[υc�h}\!W%��`�>ǂ����qrA�]o�qF��2��N��zW=�yQ�F�>���qi�6��9���q[�Z_�W�=�N����}_��W���E�窮�ME�Ro}�,�yv�^߹.��_���7�f+�&�Y�꣢��&�6�����S����6�z2s�)
w/�����'���C�&��ri;�NR\^����߇=�|>� �[c�:�/��?�u���qE/�3�oP~k�C�J�u���j
�ˁ	{�j8�e�T^�Q�P��jOʃ^��އ��❳K0�D� 蛄�AA��>�#@�����:/���Y5��6�^��E�1��ὅg|�Ł��nrl�����)V
M�V�}}2��4K��]�����i��;�6˦��2p��C����[T��`�6uK��/`� ��W�F�p�gծL8���:v����� XWz%��&x�VI�~�~���f�7<8Nv�PԞ�;�h�7�n��u��;�z������7<SK����Д@w���i��rwB�[׍2�$��;�mt���ǻό��Mt�}1�N�hO�"�)l>��?��x����K@�;~<Ҵ�"�sS�]�?�/�����~ۛ�k[ԯ(�3�Q���FU2>�*���Tc�-S`&� �ص?õn��!��CH�|�_H�#��W�_����}tS�)��z� C��3      �      x�u�[��&�E��oL��C_N��q,��0�0yH������s�¿��������z���A9����\JZ����q?�_��U#CI	���F2W�?������M�(�/�2Q-�B�랠�/Ɖ�=o�����׽�����\�^���2QJ��o�bQR�j���}ӿt�����#¿Q��lt믕>0���_�[͡����V�׋����u"�q�_�A�{�l����ߘ���j�P��%y`�w�W��V�(j�F)o�y�al�����j���ϓF/\�q���ۯ�(I�\��R%6���<����ן̂TY���$�ri�z����U�A��N�=�ݛ�S�����qx�".r�ҫ?�kS���{I�Ջ�K�صQ�^���7Z��d�2fV��&k�#׌��[��_#�"�*�ڸ$���͖�=�m��ƥ�.v��:gCVu��u��C�꣚o���U$��R��m"Q���e,n��)y&ǶjEv��*�J�E�݈���%{����Dx��zC��>S%�t#����V���Ǯ1��7�B�Myi�/�Y���j3tw�c���޽��ڗ���A�F۽�g��2U�����l��i��&K��.8�c��隄;ۥ���!����[��K�ӿ7X�S@'R�z}�*[:���B��
C�k]	,	Qb7�t%��-R�4sfe�~*^���H�o��y���y��|)�Ɵ���!���V
�h�޸�d���<�]�\o#w7��-���{ܳ��5ɭf_͒Hn;�!���϶�������*]�	�|Q[�#�9�� �F7�HdE0�#��r�z2.���]#莢d-h���!z�h�8����#�Pt�C��C1�s�z(:C�RtoȱuO��KѶ����mv�{�r}�ف��98��9XN�^�����A�󤔮@���)(R,�C�&�"JL$J���D�<�j�L���u4���!)\�Q~�P�xIӾW�{�=�y4�i!P�rH��$]ֈș��=t6Bu�[9�}���3��8���a.��pq�˻9˱�!�U	F���,g%�C�=y�-��NT!�4B�	Y�ƍ�3�k�a D(�u�m<H��`&sx���w�~�	j�Xt(:ύ��� %nW���Wr��/�?K	�x"�����cD1K��{
�!�J�"ɔr���w<�Z��������!�`Qs2�}�A):��4�é���ߕ
'+��*Z+����r0���Π���ur���H6��=M_W�b�<1p�6��uGn�%\�W�6x���=��	y̱�D*D��>����}�c�9xtd��IeLF�\�7�`��&��Z��,78MG���s"�"c�>ݝF���D\�y>�}��Rf��5��lnD�kϪo�m�>Q�^�v�r�	X��"{#nk�`��Bc�,n����ǳ4��M~(�e���-��-S��-W�C����3�O¢�Xř��6_�l�1������p�I�x2�h��V;u�m�_\!�7:�Dn���58��UtXWr�Fz>�M:��E�Z��0,X7�����t��ܯ���h�s��
��My,��\�+њ6b�O�#x+�m����+��C�ew-�~�)a�u����W��dp
�\�bYm-5�xD�쇖#Y6�"
X���=BMo47�e�y}��A�TE��Z�D���-#X��&*�F������AШ�-Ć�G�!t�pe�H]!:ӂlp�y����1 m'��H���[�C�tp�1!�T�����(�wS��xSU�+�I@�%�-�6�4��.���贶o�1��8hd\����� ����%?���� ԍ�[����~Z�LąCע1zs��)yb�q�Sc51�EC��tR�M|2�M����$��3���\X
AQ�kQ�����}�8���oyQ���튼O�X���1=@���љa����C	#$�q>ڽ���R�i|�[=D�bp�tE<}`aB��&[th��ܙ{��A�"����vl$�\��;A��y�B��q�*�%�rz�C�U����3���,���rm�K��-?W.�<��01r';؈�zE�-��Fe�7Q�C~͑e��bO��8�gZ�����Q�>6n�"���Q=9nB�f�1��6GM���O���S$T�����V�[{8�^ࡾ����Й�C���/h>��!`���m,@P�͵:db:�W��ݜdO�)���pYN԰�p�?�N^lC���2I�	��#?�/*+��H�*�<G�x2�����"XyE	\�F��:���6t���%?�R�쮪 jD%S���#�&	�<�p�c'B�Ʉd�0�	3��q�Dv�� ���)�ޛRc��&��vT&Y!�$A2*�N�˶���xr?�&Amwˀa�X����"�E���	�,�n���X�m��C0����/�|� ���C�d��Y��Y0j�#I�4&b�\�λ���V�ލV>Oi�(! >Os:�"�&��:V�AC<�e�iVdǆ-dk-
o0g�&8�7�FU ry�r�����q%;��0�*��27�Z,]ty�y��;%�\n�|^�OR����善�ĈI��P$=��:y�Ez�d�RXxY�jڇ�)��$�k���-
�q�E����Z�=�.��.ad��iBW\��T�[6ɒ������$ٓ� 󟣗/f�Q�d���C-�}P_�[?rmey<߷��)��$�Ɏ��̸��������".��Z�+Y֎�S9ܾ1�aϙ�A�6�麐�(k<D��0<�oՁ�Kz-^`ѱ������U%4���=�}g�9Y���\��r��x�4v�Egw?�+�S^ZI"����x��MS�%�x#&�
��#��S$�)�k�Z�8=��Á=�٘�dgC9��1�K?�d��"a�I��o(���}�A_f���xY�Q����V����e��Gމ�a�Ti��b���I��O�����k`
�C�,%m�14�����~��\����"f�.՟�\�KѷT���jr�v�Ğ��p/ ��K3]�5X�j�eC�T�$�G����I4xǎ߫o�2}�1>7�I0Tn�;1g#^��a���|t�܈�CWD����s�6�k�* ��YfJ�+"G�rҷj> ����_q������Nh������]w]�C�8�B�_ ��O�A����pC>�x�ܑ{�8?�u��e���w4r��,�H��a��a� I�!�R$j��t&~8͂N�(8���4�W0�~Gh6��݉,D4�b>P���qEv\��7A9z�M<S#�̏I$GtC��e���W��ZJ�9��]о���*�>���`�;�&���	�/���Ǆ���R�d����J�ُ�=J ��bE�:O��VI�� v���gJ�}����L�<����\�/�7Vn�e�hk���`2b�l?ީ\O�6�g�H̬����ߵw�)���p�xSB��{�����d���T���DR�����$��+��5��2����P7�ʆ�Y�o#�zg�O����P����E�����3��}���Sx�إ�ob���M�81��G�+|U��5r��(Q"�2��L�.A"��+�I���O��.ˈE�\��Iݮ�-A�\�Q�ѽ���z��ů����������f{����@n�D��F,�)-����S^c�d�8�D3��[��Kv��E%Xk҆�(0�&�.�m��7z2��+� e"Ln��%�M���� 4{�w�u+Y�-j�&�Q+��9���de�d-[Z�F�Y���YA���1d\�6���?�����C�ՙ{���TRvSo���W�u�2�ruh�")�W�ͱ�a$��*���|����d?��ڦ��I|�&z���!D:�s��:WE|RЦ?,+���:�O�7}��_�n@*�0M�M�Kvp�ʎ�����
�%��˼�_(�-o�7��Mǻ�S� �Fv�(|���,�)��q&Y!�3/���< �}��HI�����_�(��2���_rah
`rz4������䵒��!������5�\��\q��m�9�'OX�    ]�آ۴#8�]���|;#�>a��[�d�L�ae���65F[���Y-���="[��$R�Y�����+ʂ��[�Z�1�0�&��s�3O6Bd��ҽ��e-{���!�Ct��XFx�v��_�[���D�%����R+<��h�/ ���]����o�p�c����mh�S��@���nC���A�e�p��Fi�Y��Au�y��*:t�}��kQ��~�NECkDG ��$Q�_Tx�g��As�y�����Gî���>Q=n�v����КE� J�1T�)��ͣM�����M�2�F��)j�ѭS��x��+��N���U�,���b[Ո��nc#�)A��J��Fk���\3u��j��p��2��R��rH�H~��iTS3V9$3��lSZ�j��g�����Ҩ�`$#+J]Vb�H�Y;���]\��)�-}�7D� ��EэH�1��O���yT��QC����*��%�M���En[�����į�%���M�����iK�1ը\���x���d��jD��H���Z�5�ud�����0#C1�Q~)B'��~�<s�z(����aw	����Ŀ�c��"�'AI���N���J�ƞ���D�P�k�1�(�M�P��C��N���<�`�yWԩiE�u�������8.���_M��dɁ�-��N��`�ETՈK٨F��	��/*M��j$JR&ɘA1�F�9Z�(�i�5)FC=z�:Xi��q��
�K�Ŭ�Y�4V�jӉo\���Q,޷��:��c'']_�B��,�6>�����)��z��#w6J{��m���	͈�T&*�S�!���kãt��Q�5`�v�C~�&jX�Y���=q]ʾM#0�̈́��NԹ<�Lր"K �q)r�엄K�t$�T˃�:t@��R�	G�n��޵K�P\+H&-������삒sԅ�nѧe1��"�kW;H^�P,�ԏ`V�����kuZ7������kGˏ�R�t�D�z�>Y����@��k��p`�BD`�����E, me��Q�#hz>h9�p�1����-O��7��Fܟ:Y̪��5�Q�BJ`�%[�EU�'Q�\�
3��m� �8���i+J�!���5x��aP�%~�x���d+O<APU%���i��L��r$<h�+�X�2D)q`Y۴�%����e����\+�
�~1@,�e��S��.�}*�$�DQ˘K#�Sl��9���z��M��U��3)K��%�*(�!!��	�!�����P&�;�D��es��#�����Q\�G{'J���I*#EH9�$"}Za4Z���q���d�H+I(i��p���b�uE�p�rh�I�薗��Se�j7��g\�A˙Om�����h��yE|���r�^���<Ji#��,�U�\�a�_�,%�䦪�bK����2�UT��h�.�_��)%�T�)�E��iB����o�.dGֲ�c���\r�c��5b΀��r�q*IN�7�KQ�����]�.�ꔵUj�6�����b�8��E��*@�jr0jb�l���%���{��g�X��H2���.�"u	�ΫG\���]k=���_��iָ1�Ҁ!�	2Q�hpe�N�/+a�v�Ӄϔ����������FHo릉��V0����e�ntr���y�&���7,�a�f���@��#�$a�\^w~����Q�M6����Ś�Cԥ6��a�5�8A���Kz��[F�v�1�nt}ųj���w��N�an�����W�z�. a!�����Pt��J��Fjg�GĮ�ˡ�afGN��}���К���gا�Jק�V�q���jHlשm�h�1&:�U��9��h�1;J^X\�4�ǵ9��hp��T��&|���ц��"f�QdG��<0aJ���T eJa琽|�	0�Y" E%ىF�O@�ǲdH�g�����y4���K�s(�; ^VQ?�=H���H�TT�}�E�<pP@i���T�G�֢"X����^I�����6��s�M�@�w��{!J�y(8��y��D<V.��&+
G=ЮrJ�x�J��F���6��q�𺝤I�-8�l�K�������>t��h�IZ�]����sh_�k]�� �r���@�a⓾q�Hf��m�@�JB�o�0NF���$T�M��5⩱;��(};-��C�es�MTi%�����$O���9W�p��=����8���A��dqd������X�v��N	8��|�GEOьb�0�I�-�M���fS!�˥�ɒmz�EA(�Q��z�,*��G�gN�	#�	D�v+�Lĥ�k���*�!z��l����-�4׹[0!��$�LF�1iV��$z�&�C��$F���$�a��N�uC��� ��f_F�]Es���+[�&,�4>���C6h��ڌGf�������I�5t�O��M�6�nK�T��|m�I&�<�v�O����S�9�.,;��%W�^h���a_CR@UD��(B��f^��
|296��|�2H�;jA�|��5���#�t<Q�31g%�	s��_-��tY�YlU��=��E��CR�d��'
�}R�p
�b���V޻0[Ew���AB7+�`�`��!��L_����u
Y��'Һ��5�ܽK��@�4�J��]�I����UU\#zUe�;�E��ܮ��lq����ȋ�%�]h�>��ή��2����mh�Q(�O�Ե�"'L ��k�{
ɋ�2)D+^���5�B݉�)	+�����MO�W�CF��h�&���2d%��C=ۤ���P����|Ǔ��P��A�ik���+}M39�-�s�+;8d�^�JI�����U���	W�݅Z���&����ŨH�������ʽjJ��&G�ֶ4����Pɥ�q<ķq<�w�˒�%*!�y!y�A���)�/ɱ���."!�ۓDw�y��~�b`l��_v�H�E{Q���T8��D�NK@Ε0I�v�+-.�%��;=��������FGO�B�Hڳ���`~�E��zƐD�&��W@^�1��4I<�00��p�?o#� Y�Y^5o��B��5��z�҃"z�J{H�T�QOy׆xٽh+x<n�V�2�?��	|҈UOtڇ7'@�M��SMCT���ha+?�7膶U8�&E޳CϝCZy���2f�FkQ�+�L$nJz�ч��Ҹ��\a�٨h����G�P�6�p���ܠ
l�_G�]�[���h�qt�Lyn
0E	C�$r�Q��-G�Eq3i�BX���ʃ�o���|�͸|EI��7��r����J`'i�1��T?����Mzh[���Щ@�1�֎f��Bԥ��<��pp��ogi��)��^軘V��P$��wu�Ӷ�����(���@+o�N�>`#�� )�g
�y�2Fr��U����X��Ku�%M��8IFP�ё�҄F����Yd���Qwm�S��b�܊ufT Y�`��z�D��a��� ��K�wx��%�̲2���Ȥ��'~נ�(���~�{[�f�R���\Hi���w��"�C��.��%T��D�.�V����7���,.SQ�Ɩ�5�p��,V,_[U���)4m�7dɫ*<	��N�BXk�j��=3
Y�{�+�$S�r.[ݿE�E�%��x��=B��˞%T���?����1�!s�|���V�hy�RU��E\�ES���:�M����rP%ܪi+Yb`��bV�|���� � �}�#��8QܜA�$8�V%<3rT���ui��%Ji��c�qC<tdE<{9t����v4����Ļť>>��ʯ�()�u���싎��H���0IJ{7�=�E�:��3r���U}ѡ�k��~$�,�kE��Pe{�M��U_��^�/���<s)�C�'#	�b����ձ���f��^���mK�|�w��:Ԓ5D�7�:|I���Һ!\�r䴍7͊Q� &I������n�E���C�&�7Q�-}-n���u�iQ�t�PGo����Se�4����CPG���:#�� 5	  ��]i~�֐��g+9���ʅX1�,��}���!_����i��ks#�+%i~���^�.�V5V��Vgt���]����E�5���ۥoTr2K�e �c��\']��Z���d���R���]�������dV':�(:���u1����;W#n����G��Q��'jde��*�����3hA&�߃�Z$T��BV�����"(���y"��:�ZK�v�P��_�8�Ҍu��bX,�0.=�,u;���\��3�?�34�TIX�'��ҩ�̃��q�-���V���U�|�W�O7�F,&�7��]n�q�,c$z\��<#�6����<��!yZ�d׾}�#R�Oۨ=��_��&T��(��9	�}��-����6����I�[U�(�#���#�J��F�Q�U���`A��(�V7��7�G�$ٖ�4X$}��N��,��i�4�}�qĤ�{�I� |R�!��DZ�n���CK�p��kP����#��[8\�ǯA=�҃�C�ň�)2�Y���m0b���h��s-%z)B��p�ۧ<�%�y�C�]+_�?�+�/bE]^&6��.�%�S�'CL�̊8�U肹��֞g���p&�E��$kpDK��:'х�	ꖦ7��m]�v��ܡ�K}��D�PDۈz4m�Ұ�
sFf��)_��{2;�Ö%O������o�1T:(���A�X�@Ze�p�O�vE�.�|^9`9%�-�'� ����9��+���k�� &u9�5�&X�b�e��,k��g`�y�y6�[;�ua��X�D���V�����J�b�H{}\�3�_$�6by CL$/�ޒ�j9�W6�$#�6������yr)�.N�/z��*�ۡi�y��Z�Gu J�d�2zǧ^���.8�J�~ �L �BD�����F��הRx�K1����o-��Q��S����vC��c�w'6��V��+9��3DsD�)��kA��i�`�;��8���~IcEoޝ�+}�e�詑��(+-m��X�i������>���I������z��=��:ɡ��cF|�4С@�hݧ��"����_��`"�����B��1��W�yCp�{�>�4�n��"%�_���+�=|D_7��"��h��7	�/�c���;�����k#���7;�_� �!
�:�~EM~��з:~Emh�@[�:�P��i�/	J�~|�ܒ`����td�)k��g)�1�T̻$C�LH6�KE��ql%�_A����DAr��^�"L�rIG�oZ0�_A�X1vhh@ƶn�#'���U��7�`�~���|4%�L�}֕c�R�
�/��ފ0�ߐI������A|a�_�n�W�Cx$-�8�}�ɹ	��∿�D�fE<�Iד����������^&����ϋ�W�$|șm��ȇ
y>�~^!)׉��z1d�����R���%)������?�3�z��͎��T�l��|>��U�/�8Q����C������C�#��@�&�I9�z��wo�7��C�A.���@��y��#�Wޜ�L��̻|����$r�I����C]�I�� Y6�iS�4KRD�V�~��e֓�j87�M���Wژ(.�<�3��������,���w��%����"�g������*�2��^�!�r�VFv��� �]9��x�-g-�2�M�r��ǿV܌�1���^��o�����}�Ƹ�|~N7iQ�����D�i���Ք+���fȃ�h��+��^�H���Cۧ ���߄!Φ�8F�;��&�MX������&߉17:}��A��A;W׊�\�YNm�[R�ѳ�|�b��^9+�0��zN�����A8Q�b���%?U�ݲLĂL�!❨���E�-�I$0�Km����+��r��_6/�K�^-j!_4v"�ɑ��������V�ri$y��<I�+��"}��3u�>BO���W��lڥ��I�Y���=��^S��fe��qH�zx�S�����̟�����(n� ��;v�C���
�H�'��ϭ)������/4��p�C���?h�V�_�*����?2M]�-���I��\��O�x�*9�<��a+�X����i���,}����|�ڼ�-��%���m��z^J���Hk;oy�P��&�@G:���Ny�s1͊�����	�ъ�	aq�Ƚ��8L�bQ���9���`�96���F���	���R�?��KF�"�
P�#����t�D�Z)�h�1����;����[�~7�M�F��[�/����"z�mp��iYQ.�DK<���������W�r      �      x�Ž[oI�&���+h`�%�v7۷�EK��I��U��)F)���������ؗ���L����>ua����=�fa�~x�p�
��*E�͎��wn�`��N�OƗˈ1|��="��?�����������gt�D������}������<;(�jQ����Y>�R������������\�/Ş��ɴ���r�i�헋?�'��]��g�Q�1Q��}5����i��|�w��l��l�.3�"�P6�I�Y1"�{����?���c�XW�M�����j��N�Ų�L�|yFXx^-��uՀ�����ѻ��<FБ��ߧp<�sQ��J��rqSe�ՠ.W#8��������l���S9��qm����:{C~���>+o6gŲ㋫7����E����g�Hأ�P.V�r����?����b�\�s����tm���٫��������WG��/���Q V����z?�^����5U�|��_Κ�[��;+�Uv�u>��$ �Kٛ��^�gj�E���NG��ٛ����k~��4O�{g�O����b~mH翙�� 寳�b^�d��g��(�� <^T�a������q��!�:�#a��[L��^����XM�����|�-W����,A���M��F����d�q^�Ү`�/V�O h��^]���f=���i��	zD�e�k�\;�I�#د�ɬZ����[�Y� �����.u���%Sξ6�@�N?����s�1$�G����&�0_�?���\U�%|9U��d�ɾ�l���S���f�X=��币d�R���l !Z���P�P
��
�����C�X���#FkPN������P���&8@*GJ�_N��e�q>e1�g�o�U��A��?���jv[~�9���]Y���8�(�0Ɨ'�H�4?tr���r��	џةᩁ�c�����v8$��ϫ���:-?��&�_�O�r�Y/Vy9:�-�m\<����� ą�Q����c#Z[��ɪ��s8�Z�Z���_k/'tu�\��QvY���Ӈqf4�<xy\d��������k�(x�pv(L|F�������j~�]�N�Aq�������r�s�Y�k9��e� �V�#����
����z�s������}Q���Y�N
�^�34_3��o9�LW���4�����
\�*;;ʹ��ysR��cu|vt�x��+�"]����υ��#�k��o��^���e~p[})��j�	�uB>�a��c���.�������g��䳫���w���j�s���X,�P��Hڿ�j~��/�o@�����+xh'�fV`�������
�&�ݺF*�ȏ����[Pm�n�TGb%��	o@/&p��Y��.�`��������K�]L���~SΪ	h���d����i%��<�i�x׊�|�Ɉ�$�4�����axTm�da�:Ā���|}o�ڟ� э�j`�����LA�7���ǜ
�ܖ�i��O,��=i����������=2\h�g��%�B��J{�<;xs��2x����r�:rl(�n��{�u��!X�eP���Z�m�T-��c���u��Vi�ڣ�8>���	�ZR�ӹ�X��#f��br}�+wᡵ9����Zk�f����
�@�ه������0�Ё�c��F�^܇j
V��U��w���B�
ᦿ�S��VT(
�@-0��$k]���@�;��� Z���W��dd�`��������_�ϳ�����rK� ��Ϧs�m���i����z�K��������#8�W�?���v��((m��|�����7�7�>�?�&"��.�8Z�*��i�T���dq}��:��k86��%�A'&;8:ۺ�Ǻw�#g<	KF�C���QYm�??�_����+�=��ri_%��Nqn�q^؟�8��燣W�ڜקuZ�=J	������%��0�:gB�
��V0���z����+��tZ�.n�@֮<Wij�����OV
���:I~�����Bߌ�
{x��B���ٹ7Q�V�M~�\���=��j�L�=�Z�CR�iT�7�m^-(��KL��Cv�op���:,�=�P7s�|ŝ_��<?y{�;]�c�����w'�^{5�~��׷�/V��7��U$���Z|*����W޷��_�?���rOsn���M�ԘD�r~�	_[7��~�i$������I~��X��L��d���O��*;u���<Ώ���S�^���J�	��!��E� �F�HYӴ�Ee�i=��	!v �|
=:I�H%Dg��3�^���hb���ٿ�x�\�U���������>'`zޕ� Y5
��Q�u��_Yz�t��1-
�=hgbO�;0A�HU�e�l�	{g���>�#�w&E��89�ب���o�;�������������ۿ�[���� ���^�"���L���D��j�����brm��`Iu5׳�vH>x���U�U����Tq<K����Ad9�������Nǯ���,h<>1*G�^_�	}��& B���V6ع��g��@����f���L�b��Ӿ�5w�co�����$�W?m��<`Y³d.[r���<�Q�/7�([U�%h�<;�b�N�������7��Ԭ�{kW���i|�jJD�Z�g7���U���^�I5��6��\��j;uJg�G�/���D7����"f�H�Y.��)�X��?~�l=�������� �<��	������#��� �ё?���C��ɐDl$����ö���1��]���^���v�,�F��!h�}�[���A�<����w��tn��Y�޺��1���YLn������r�AB�H-�U[���APX�~��;���H[%����T��b�Q����vd���|ou7Y�Qu���U��Zz8��N�fDy
<�rZ��	����;�[��Pxq3��7��:*^��)�{��?�3���u��M�ZgG�_B�MX��N�q�_T�>�#j��ee��IX�0~{f986p�럜�G�~�4�m����/���7�9,��ОPi�:˸��S���O4�*׳��l��1���	��\>:��8��~z�������w��7��o�̨�+�w�5X\��N��K���fY���r	7ɲK���e��5���w��e���a&F�G|&G�x&����b|�;ݴt��ӡ0���+�����Ѽ�l��{ǖ��sM����sN8r���z�yW1 ��Y�x�L��U4��H�X`��F1W�"]�d��J(~o��N��v�FD��J���^>����,F�~_Ko����J����F�Z��4�Ѿ�I��՜)旇fO��������m-߂�<S�A���	[[G�u��}&�(���4K���Hꗈ����g�ߩ�@�p�j'U���|�����l�I	z��N�*����j�Z}*+�HY��*d(Zi],������0��#j���Y]V �����M�4��.�P��}=�.�H۬�m����A�]��c6��b��j�	t^ݰ������x�A�l�LJ��
��4��6���"�o�F�j�B��48,D]`�<�|�:��ڨ�}P���K	⾅NS�#���Z��8���e�ش|��/�� ��fT�Y���"3�����g㫋P��RY�E��+�[�^�o����rQ�X�
'vk3��v��e�{	� �d�����_f��lRM����o���Ű�Cp��B��E��6]�9�?�VP۽��_2g_��m��O>Y��Z������ �ȇ��ϳ˵�V��5��m��������`�0�:��;r�p��Y�#�d�6�������V���:;�X�꧖�� �p戢�nsi��"��&1G������
��n�Ȥ��#MH@P}��5�F�I0"��˓�U`��V�ݺ:�<��޼��f��׶y������ϳ������xxz��<��W�����}�ٻs�<Ի�lzFd�ܰ��f#GC.dIxp�%���ݰ	��nuϔ�2D���vRt�&�~:4��ɯ�x�g    [��-�Ū�c�C�(�z=��t�t##��&���zl�60����#(����x؈���Ywa[xyX�;������ށ�wm�H��)����m�e9�V��WV{�f�ns{<ϻL��=?:;
��P���B��Q]Z5�|��6?����r����i::���}��8�Jɖ��<��?i�8�S��Q�p�_��ro:_m+��/׿�b�{Nf#��&�hf��0�Ϩ�����=�)
Oޠ���Gf��'Ǉ��u���!$�F�:[���Nn�ٺ_T��Z���h�E���dZ��Fξ�qg�*_yE�g������I��;�R�^1��W?]�g��B,���V� ��z1)���ޖ��_-�+��m�k��~Jcr��3�����-`R�v5�\%���[=��C\�ڐ���ǧ��%�b��i2�TR��e�	�߼&�����e�cn(���^3�����o�98E�*�Û{Sɶ��5��dCoM�G4>o���D;(<)�������ʉ�n~/'UF�Hg<]�����|��W_���;�h��N�#H\�<P�ӌ)��zߥ�	����_�K��p'�b�x��e��1ji(�ф5��}C�p��nr}=���583w���v���Է���o�i��>��bA����2�2�F���x��B�������@��@g����<��t�|�9U.�~�������n�{���ں����?f�*������g�+j}%qyj�=�g��H�T
K(�7�>�����u��������F]�7���9�}6�<�~����2��.����@.�/p\V�N\��������e����������'�\�ZȖSZ��n<.�%.��2��ꎊ������4s�bC	&I}�6C���>��4rTԩ�A��P/����!o�"V!��X�
���k�8]��$��&��.����e�eS���l��gG�ˀH� =�*��ÎJW�y0�ͪ��d�����f����$��?�\��6������׏>іL騰r9���3[�2_T���J�Z����U	*zN-K���-Kd�n|rt�L����k7ň��{]N=�ܾ�Ou��-���8����i�
@V��N%�_e]O����[:?ȖL�DE�ǯ^>F#A�@�F��d(����n�Ze�w姥���	T.L[ܮk�[�3� ���mK9C�=�"0���;���q�5��c7�:��%����ͪ�z��E��t�^U��7��?����p.��U�V��9K���!����Ƈ���*���Mf�e6��w��bs�%<�|1�Cp���S����E����(u 1� ��&'inN��������>\��������I����巛l=�&SPQ��9<�`꾕�����Y{7��AA~|;,��E��":�������^x�ٳ��
�E5[���o��3��)�[�A?�~�X�4U�c�~�y��{�OD �Y�<�����9u�y:�J{�o�2IGe�~B���M�&����5�����aB|���l�+��2]x]��<]Z���yxIU�&aAl�ѩ�1�7@����9@,��{����ɥ��S��7��J����)	�}?�/�ˤvQt�����ƶJ��B�XԴ]��AΘ��7�
:Q��#HG�k�s�	�v���	�rfGZ�)q;</�i]^�����WP�U��rU~�.������_�&N��[#��uLqa��ώ�F������4�]F��W4�P�x���V�ù5ܛ�!��\R���/�i��l� ���r}�c�m
��$*�2����2*�t�����g`�A����v�S� �����Ela�;��[��}��������j�!Igý�<��z
�K��F�)=��""`1��G�o1���GNg��̝Qp����s	��Jţ��'������G�����v�x�(
wEy�އ�|�F5���B��S�J�Y��\��C>k偙0�+�	 �a�����S���x�8�����r��]�/X+H���|��M�a�a�L?Q��p�z�fZ�����0�έ0����,�k/;;���2T������i����bZ�kʎG�3������l]})��}��?qqsK��Bz^P=�40�}���B�4Nj^���7��D?�Ґ�R�h�/j���u�;�C>k�T�gN�kP�l�F�U�1��-�K�������
�������0;=&zya�����CŸ�s#q�[�wt~]sj�y>^Օ��}	'��r��>����8�/64��6Q-~���,�{�l]���Ǔ���'����HV�Y#���aÕi�۰P$�ꨫ�Lu@�恙���A1��Ȩ/ ���l�aN4�P�^?�	���w�""��OO��ݎ~��A�U^e$�8iS�����h+1D�!	'�+T���|�� �� Uʏ_��Q
Wnn����h_z�QA��y*�P.�;���g�n�t	�~�������嶛a;��w#B��>y�p.����4�fCChƌ��28u��/e��$�Y�S�
����I~9��G��jc����ʻ}��yc�cǕڮ�.N6��>`�k����2��O,�9D��k��X�jxP�`����X�7��SZ����t�zJ��胺�4q>�S�?�/0��Pe(�����)���Y`��ޮv�b/QR���8�/F�>qj~ s�i3�H��ds�un�r�aG�FM���2�n��.i�2��Y��Z&�AKG�\hWV�!�H+g�|�Y������C��ÎC�㠇��8c�e�`3����0-1�Y3r�/�ֵ�~�$U����<$�0��#����+�S ʿ)W�M�f>�-�K�#}�����5K.��;Y�Z�#�xJ�˓��1Τ/V����#uJ����{�,V�L�����n�����noKpDׅ��\Թ�	��m�=\�&L%��5nhpjW�>A��o݈<Z��-G�%�wNPpN�X�(��W��M�'�
c�Ug�����"�����d�8�~��<�������y�<����kd.zHWù�C�Ɵ�Q�q-l)��p��� G�("䮄:���*���T��l���J��;@�|��]���NUj�]�����S�4�m�<����i��1�Y$67��1��f��b�� �"�w� ���ʣX�)G����iqj8�����ڸ�k(�fw�ՖO�Ocn0�-ڊ�+��>єAT?n�`v&���r�� �������ne������%�F�4��bG�B7�B��� E��A���ByD�D)�jq�f�@�~p���P	� C9G��r�tt#ƫJ���:ľ���Ԋ)������5�MDOɶ�t�&:�$l�����O~�q�\R�S���G���Y,q`/���f-�a�~�p��aw�m������j��4.��l#��5��6�.�+m�����-5h�82V�uv ��xng��T�?�0�}�=\jo��fٟ���b
����.%�;ќ���O�8��f�:Go�aǃ��lե׃��"~?�&�-��k��\Q�]�Q�h�`\qWr1���+����?�Y�|i�v�'��U3�F<O 7��l��|܋������4��n�"7���nVnZ	��"��+��Zh�6E���Z�=���[5�8Q��w�)�1�?�p¯hJ��+����86��ěV���l�zq]�U��F�Hu��E��ތd�v��v�Q?\���M�I�E���w�}(�.�!�K����x���5������ߕ�^:_���+���h�2��Y�wc'��ɼˡ�[�����h� 7��a�ak+�zC�zm\?� #��z{���ݍ8��r7^��^7Ɓ�zisfXL���	��n����'��	P�/=M�.��oI�b�P�ҫu03�!�k㋜$z�E�R1���^�*�$�+	;�%�=��=���@��t-�/�=    ��c�\�����*�HׁO�R$�Z�=ƀ��k9�E����9�T��&ܠ� G������~x��&Q9����qR�?��R�����B�X��^��Wp*��wu!�{[���co�={�ӷ�u�ү��sG�IT�Bb�K���Q~E�0�L�j�D+J�]Zkk#Q1Z�gFJ�Mt��,<�u]�3/�],�׾_���l�a$��E$u�I4�(H��r�,� ����kj���U�wx5_��j�8
;~6�퇵�j�|*R�xO�P\'7��"�4Ҍ}Qb>w >@�H���Q��p�Ze����xl�-3��g�J����֥˫H��
�*�%.E���BG�H�#�ո]wj�s�]�2U=!���:�K<��j9׬Lp�n�!D\�Y�3�z�Ea�N�� @l\�>�B�D:�4��}ePXp�T���Ŵs����|��I,a������ as��
��DOѨ��f�u�
��<v��)��B��QHV���.��Kr1P!��T��>	Wn~{� ���������
ST26ߍY����� �&*;;���/�Y�beĨ#�� ���p�W�Y��&��������br�|���rr�(��K¶���`�AP���L�%L�k��Gܤ����5��Dnz�B�d�(>f.}�bz� ��`| W��c
EL�����j�u��
�|Z'��j����9�;zN9��h�E�[��a�p���H�
�}�q��N��dUcw��mZHo4�:����B�j��+ �� ��iu�:��B�f0GU���"�/��v�U�
���S�Q��eW�	윕틣�]#:p���3���A�duϫ�����U������Gk��ʍϰ���$5����r[��}�_�Fr麮O�qX�Z}��S���o�����Q����l��#�[�����~SG�(��¨�1��� �F��X��w����L&���F�)��6��0/ѹ�9d4� ��cԀB	�ȟ�~XW�B`���s�QE�|W\*;ǚ�'[�٥J�E�~�b��T���zx�I��
�m�Juj�ϖ!�����*O�-#�$�*��&��`,�+~�����3�D�`;�h������{������S]Q('�C1'ٛ���bp>P��َ�:�R�l��A������Ζ���y�C)�\�=���1��p��ހB�(�*;�����gl4�oHX�r��u|Ǆ�~9�<t�)�:��f9\�/�
њؽGa!q�#RUl	.}�"��@�3@�C�n���bE���'�'��O�����=�c2¥��80I��7^��n�a�!�qS#��V����y�w��B�-
�\�������_�������O�K���^�M郏	�jH�B¡MB�V�G?�#+�4��A}N��V}�H졙y�wN_�c}��V����&�
�w���,�F�p�pC\R���he�0�A!\[xSA���	�'UR�
�k@���[�;tP�M��y��ď�HgqRB���1
D#�Z�g�ΰ����]�fp��%�����aS�p	�ts�m���Y1�A��K���
I<	A!�ܯOKCB�������6�0S�tK>�&-]�Eź��:�a�C����Br�����Qu��B*i��Mu�V��t�jD\�Kʥ�����5�J�F�c�f�fj?�<��P>L�c�-�S�I�R�ɤU�l��\�����I�lz�.��'`=2:�PE�^�帻�� t�6k
EZ+Jp|]o<�T���N���f}a��F��(�"ҩۄE�Z�k+�Q�.j��#���ⶠ��M`�/t���]�W���v�7M�ߙ��d>��C��;,�[s�Skpɟk]QK,,��@�������Uv�
��b���ߩM��\:�u��+�<_��7�El������Z�N�oG"J�����u�
��i�s��lD)��`�ɣ��� '�Ɇ�����~�'h�t�ғ�����Pv���d-9���h� �%{���v~<g\P���mɰcj{=Y�qB�5B��c+4.la�$\Q��[_����
�ɣz�|��DM}�k�3;���2���*\u���8	��g� S߰��c{tk/�a��yj/U�4B�����y��i��K#��>�4�7�u���I-\x�h�u�n�
�A��;H��Bhݪ��x�
a��LQ���Ҹ�nL!�'��Q���k�L���-���ls�߳�څ7�5=��Q�+t��r�:i5dx�0�U$��%�E�tTwz��3m/m�ˈ��M�+?V(.���\\��s����> ��r����һ��F�������n�.lH��e��'�'$�3�)�3����5J�D]�^A��:L���51�q$��A����6�>�i#H�pmz/��M�5���z끌�FO,hk1F3�q��FG�5	Z#$�A�1���@H/ʢ��IzB��f�jO_ �.7����'X@�̋��ʢ��Q���Cb��Ex�sZ/8$A���DO�F#E�L� �k�s���h8�0��3m�j�A$�Α��:T�m0�wD�:�p���x6���Rm;3&�?�-���j�qf����Z��$�,�^�r��7F���d��$$�p~�q`A�*���;�0�.?O�ߕ�/��d��(�|1��̥����[�k��=�A�n�%"$i���Qe�� G��E�0o-9��v-Z3"�	��pOw�A��D�4l�$"�p|r��]
�@�P�$�����m	���j�y���.��o��r2�\�ߤ�U�/I���	��78�
#�_a4<�DyH�?�P��t�t�j#)����w&��&���D�����P�W��-�P(��N9�Ѓ-|�K¡P�?b����+��Gk&=P�o�lv���(�^��	qm/�Tj���D�=_ט�GR�*�B���!_a�.>��KR�]�9:�칈�d�+s���^�׵���1"��|�6������u���dvz�	��I���m�_]����8-,@�S�ZPǶz��=(K�ߗ���^a�5��y��2m
�nZڶ��j�Z_� �/30����:�R���V�3©Xܘ!��~#o��IU+�š��4�ǙC\3�[�*ӭ���	s-�z��7Y%�WIj|)�0lZ�c\�/!|������0���:Aw�d�!����E���(\�^�8�Q?�fL� 2bV���[#�jC��8x`����c;B�u��u(��Yc���$�.!,�w� �E�q�����%_J"Y{��X�H��e�6u��d�0f9-���Ә%�w���	7 1�F�G�v�_n2�d�5��X[A��ώz>��"��8*�L��.�c#�j��E� ��0+��6n��w�O8�=;��/��*���UC�v$���Wo��W�a�0���Q�t�x���������V���c�]G��FCia���}U�'8��%,ʑ�����9.Q2�)���f�T]�7�����)Q�u��R��K���G�!Nb���ċ��B�n�q�����av-|�|D��=��W�\k4��z�#E�k0�E@X|ʚ�nN�*L)H�fc|�a�[�7-\Uoc%(�l?]l�������n6��'���Y���t�1,'�s� ������nY8ErO閺�C��,(,��D>�#�)l�7���p��rB�}}/g����2����R�x�ƀYhE҈�?-�/"��G��	�8�!D���~o���X07"���������XI���No&��dSe�у� D@GA;���K�I���!v�.��/"���#I�I�t�[xή�>�pi}�z�$�ũ���3��H2?}{�I)[�D(�Q��!�G�ꉤ�HP=��;F�r���R��h��w4A.�(��Lr�\4	^l� ���q�nM�N����]>����T�U�~�n�O�x$GL�U�Kޫf���v9�c�)�s�$	�=EjH�    �!1�G�W�TL��j)�SO��R=^<���5���|�0�1�Վ$�>!X��Z0���B��.���{U��qZ���i/\� qVߪq'�7:��j�����t�R�q7�0�/U�:�5�J��/!�q���G��7�KKG��B�g�q��A��C�����=���L�M����u�A���*�C˥c�4�HM|0��~��(AYۨ�Y�2����^��"�5=�R˺f����w�����]]x�Jb�L]c=q��.�|�D��R���e�0�*d����J�?�F*��BsZ�;|f�H؛�H%��� =�D&���#I�c�}G��a�/��1.Z�a�M\� �.��
ߙ�:|vGn�b
�!�'&�Q�.\�[��!q[5JUQ�C3�I�Jb��i���%*d��I��N����g-M��m�`�SYQy�I��)�w��Dq>;�@�v�l��)�W�sjd,B�~:���L�#��(~Y��r�x�$���R�0��k+M����\��ў�ᨼl�b,C��u��v�~��ӘX�(F�n :��c�?��sw*�0 tQ���>�an]��A�93�'����x<7�q�Pŭ�f����x��+�A]�r�q���qeݳQ��];_�\�*���2��l�aB��H�-\�B��Y�op��x�51�� Z�Ͳ��b�&��hc�6��Q�l;��P"����c�EG�5��'����n�&�M��V�|(�6��h;)�b(��됐<
	��H��OZ{�ibBE�F]O��s�`�qXup~;��~4��¶S��mƲI [�;��I�*P���]��.�C���*��Yb��f�=��/v������",�F�3�#���\x3�x�ʞ�%ZI8x��"�
B���cNVT}�\�٠�"2�gu��]�"g�:p�붹���Ꞓ��[~�d�C]$Zg����Mժ��,^잨�J7���NV��T��t�(Ҍ��=1�D_��fԥ�wW��B�.��
`���:UQo�AY)�d�k7�f`�(�;��pjk�>��*!��v	��oDѻ�zO�'���
�͋�Br���H��w�+*|�.Ge�����.vWT��0,��ݳ���c<dť���{҇����|� �uR��KY��A!G_�þ\���-�Q!5��ҏ�CC����X����2X{6��,��i�&��l�[���B�`�" c���A[֕��|�烉�-�<���t��hN&|����Y9�R5���E��?�hy\M!$�=��N��ϡ�YŰ\]��K�d�V�Rסr�0�&��9�4�c*{|vt��s��[^�1c�'��-�(����ti	�/�Ԧ���O�X~�@�O��B��K��k>:8a1D�b�BX��v]^ں�?]7�����늁�
�.�G1�c�e�@�ְ���+�e�i���B�#n�V�㲝��;����ۘ�����uI�r�b����,����L��q�诮Në��5�N�������j5��;�[oush��W��W�Й���͟��+�*ק<vUmKj����=ΰ��9�>��q_� ��7j�\͠�G\�hp�y��
�#O�������(a����/U���fα�&Zͫ��<�>Gq�JR����±��%�b(��M���YX�g!�G둸�̎naP���`�K���m����\0�ooP`Ȣ���5�s����/�.����fƵ�������W�Y�������::\~\Ln�������b>��Ha�q�}�}ڔ"��܏m���P7N&��%>��z�������I�(fPlewǾ;9��u�<xL�B�A1�G��|�����د@���Z���������ܓ��&��[0c"RH��Q�Khd���CT���W�XSL��L�E%z�&9�R��t�{��S�����ٓ�n����J�p�"F�՟a�m3둴>y�mJR_����F�i��OS�"���B�=�����l>��ܗ��A�l�:��v)AS�q����P�+�QweC=o)åm���<En���r_Y�������� j$jݾ��r��; vcef:�A�7����_M ��1�`on˅]�1q��-��A�����`{��.G�E"M8^i� 08P)�>,�TMu�~�s`0C�9U��t�Y�j"����Ւ:�܇����VE���1���O��I�f�#y�s��H/Lo���ݎ�{�����s���U��1mJ���
����<�h��m�)lk%:��hH����1�x|�[R>���yk1w��k&�g�M��e���N��a%]�0������b^Zh�vfp����ғ�� �;���g�d��=��y��\����R����K�gt~q�n}�in���a=Y����C�(AB!m�b5	��b�\��0�	q(���wc{4�����І<ED���Ay�Z���w;b�2��JvP-��<g6����2�±�sp��c���4�����Yxf�pM}���4zq~y*��/z$j���	���_������k8��|W�
�����נ�_�Ղ�wD_���_ك+
Z�󪓗th��i�Gb�{d%�/�M2P[mv��6ǆe+�*^��(�/�V�Z�Ƀ��dSx�.{#��<��E
��zY�Ks�U`�sx^2ոe��TEz"�o���"��J։I)B+t6���"i�Ujfexan����������7��z�p��/m��
�[)���p!��5H�^��X��C&�1������q�^�;�>��e��-%ٸl�(�Ҳ]>n�OYRTEm !�6��'��X���#�ؓԍMZ�KPo_�W�?�u�F�r���8��
�Y7�q	~4����e�nӄ��>?��n^��w�d���$�o�(�+�[Q�N�s��؋ʺ��?�
���cZ�����brS{���a	V��������Z�L(7zv�6]0?�|��ai�V�p&;��sm�S�D��Т�o��
����?���B��)Zu!���W!]��A`�͖���\���H[�� �����Y��][ѷ�y��|u�d����ԅ��y���-7bX~\/�xK��61B�]8�+A߭.�o�?�h"Z��|n$��7 s�W�-��������p�� qs7_��_ۣ�:Do�Qӄq��):4a~� A���T��_�x��&��̞/�ɘ_4�@�N�I+x
E�f�+�B�\>^�s�x�>�N�P�$<��jV�Q=�$�jW���B�v$����M�M�jb<�K��>s�{B�W���j�Zx�ʅ�ɪU4Dk�t��z}#��pG���CJ�4�����x[
�K�GE�t(~X�o��Y��T�r2�ٲ:Q�a�ުz� �N�k��n(�1����~,0�rG����ѴI���۞c�$����{b��?�@�+�j����v�j=(V������x�0��6�X�;����G�a�md�^�4��TS��7\���bg
��&ߠiS�0��\4s��n��;������%w¹)��m׸l��e��L�����Ƕ"��K�#�����`�mo�d�$�fn͈_c�З�9M���mJy��1�v�C��z>�(_�Ǔ$���	p�z��@|�.��Ay=Q���|-m�7��+�{�/-m�O��6|ҏ�:Mb�p� �$z<�����t+:^�ڹ�2�r�����!;Ȥ���-d�լ����,-G��7����%ϕ_���E�� C��4J�s�W��Ws�W&�A��
�C���LМy���cc1�9�T�$羫QD�c�45�M���PPb$�G]m��Rͥq����c|¨
�v�&��ɉ?�TY�V�	fC�+��������jdsz�~=�64�MB�������S��.���\M����?�����կ��k��!�<������O}.�X�
7(�%
��#�8N��������j���6�k�争�?*�>ԳW�Q|h`~�������B��O�����h\��`.�ڟ�a�eU�$«���,��xZ�    f����;��4���+
��w�\Ѡ�\�nц���U)RtB��\�C�Jgk��M.Z4>��/�)Ԏ�H�������EhOM���N],����4��GP޵2��f�͚a-G�����s�t���S��
N��-���h[�Բ�k�XDq&�nr廯�Ӓ�#m�z����F�gܕ�&i�e����Q�3�3P�5'���IK���8�u��`�3S�����vZ�pRP?�q��K��֛>W�<,��Ƶ[c>�ɗ2���V���X�h}�I=N�����G���P4�U˧���wO?�q����=�Ż���ݙZW��� #��2�uBqXi�*|9�p���A*��'q�LǕ�B�V�����������覞�&r�}��y-6qة��/�Vp^��[*�1{�vnC�s�#5P�M�f$
���BZ���<G$Hn6r��^M�=�Xu2:b*���}d�H+\8O\���Z�V���D}��uا��U����g��ü�p/�I���*�_G�}���6]���(�4
xQ���"�4�	��R"��������u�#]sj	+�4mQ�=���n�ҚyI������:4��"������{��F0I�j-<�-�Vp�~�RZ:[�pWe��y0�#�R%�J�t����0�g�j�0�D�5���L>�	B�0���(�>NK�8\�S;�Y�l��u5��0�6�M���W �W7_!t�qU��}m<Wk�ۭ�N�Ղ=t{�Ud� /�.�L�(�F7�	�!y_,ԋ�OνJŅ���,b�X\Ç�i�Z�,7ɑq��Wʕ�����{�!~;����Xe��D�/����o���C��sn�Z
�QẰ~������^L94^���ςW���B�h�Y��ί�.3�V���_@7]���M9ʎg�F�k����Y̮m��Z�<{���bo�<'ИV-�sA�8o7���U"�-�u����z@L�-cW����n���y��H��ֿ��f�Mь�$=���]� R�Q�h�/����{����&�,M�ÝS=���4p�&��hS�6L�Êڼ����Cz�����3.*Gt�TS(�OC>
�;+"�;_��j��m��9�kXIv����)�Ma|)7�-��c�N�������0��A�����!ćp�?1)B8�Y�J{��sBgRo�6����v�6/J�P�D������e��:Fw���	_K�c��#Ym���d%�q�F*�NVC�����v#pX���`C{���qo0����wvl���f���cOi�K���	׾�,ٖC�}}�7�8���g�`麱��Q����� �XΨq�T�	C��L�'P�6J,)�ڜ�i6��;Z�?�0����s�m7l݈�zS��6b�D3f�̾@�����N�M۴c�hEBυ����'�G�7R���BRָ���k#����CrT�7����n�_�zHc��:mAzbkQ�nP�K�-5���= �^s�M�K6�i����M��Z)d�5���V���X��d�f��~���o�E 0���*/8���Z�F�{�'��]�[��"�V�E�N]�A��a�5 ��p,�r�4R>���É�H?�4qS�"#p8���xa8%,�0L���`�Z]�P!#����0�����p�$�t�ƒ��1���.sض�}�B�a�˶���C�L4Q�(F�^��{���f�%�M�H�"��������z6��9�ޥ��\Q�B��U�g+k�����5DCۚޣ���mC���G�Uҏ�cauk�(�9�I�?�L�j+�>��5x����>Pxgʭk�r�����q�y�%]�8D�t���$<�vo�{��M�
�^q7�7�D�����eFQk]#�ޒl��G�u�C��c�$��~���1&�E�.�DcbD3����0��R�������Lo��	�*ʼ���b<E��R^����$؅���r��q���$��~��R'�<ATC�p�w/�MQ��p�|�� #LkG�}�a	���fE��Ek�V��4Q���[H�$��>8��k����K4�I[s[z M��	}�E�?]��x��n�z~�~y]No�u^�k��� -��rq3��m��/៳QnG�M�絳E�u���S�91��G�cC����d$�� �㊺Ĺ�``��2;xs��2i����z�˦������������o����M�#֕�fk~�����Sx
�~���0�D]|u5�q_}k��_Wp<'k�g5"o];0�v\w�]�6>� �b����.%�Fp�NO�{c�%�p��;+ǋk;Yc�Hu���zY�"���YDI1
o�NT�_bЧ�0%%�2.�&Zb�c"裰���-{E�k98'��ͳ�����ĺ��,��9-�<4�Z����b�~��V�w��0j����wCfX۪[���Q,XnxNl��,�W�&�ǐ�'�6L�����)�	���@�2dNh�;V�`J�n�U��w�A�w[eZkӞ�(.#a��S�j�6M�W��aAU�O+k��r�0	\uDϕ�>�tE�v�g#�w�ɄJC�֖�Ȃ��B�֝!�����h�Ⱦ@�)�ja��XY2>��B"pG^��آvF�F�;��Y�/�!�XYFe�����9*]��`>�U׵/�D�ֆ=�+�Z��V�\����%�n��x>���H��$%k�5������)�ip�h��4��Ƈn���J4������s'�cHk�0^�=�(+���ʈ���� 'L	8�0�r;cXk���!�5�:��c�OVRTb&�����%+���]�w����^���t�h�U�ɵ�ī׵"]N�J��9��AσZ���ۜق����ٚ*�|�QBqDh
YW�1U�2�y���&k�9߭3�h���r��
?�C �v�A-nƴ6J�`���K5�m�M�Q���vV��Ҿ��s�F
'l��"��N�F�r��Sh4@���U�s�8�kw��0k����B��aZ+t�(��ʽ��J��&߾M����s=�gߦ��ӫLXb�_��9��yV-H)L��t��13 ���F��mصp��.{��'·"-�D*{wq|v�Ŏo��F�B�u���-&��jY����c5��Of��ev�t�i🥍��7x��Qn�os9J�8�Cl5��7ճ�YѸ� ;x��Ɨ��'r�#K��ձ�� u7�<�V��]�}ªA�F|9�-��Z���a����j�bh�o��� ��oo�{Qu÷v�o(��E�՜=@څ��w9�\-@���1�8/��fy��~vbӹq�U�Ӌ��G�J+����4�k\s��ϔ����Iy�G�� "���z�43�����ٰl���R�:[����@��V��g΋M��S��ox>����wM��"Ŧ)�����2m/%��eW�L��ss����6�]k�
�d*GU�c<\�ع+���p��W��z.��ո���
���8 ��v¤v�����ӵ�`
��cך���_�r"��q�ݵN@�N����h<���O�v��>`���v�" �͛��E�>�0M�[QB���uI� ��#�hd4���)m��?;E�U��R�'��(B"vi`�/�qB8�����!A=kz�d,�˲�2b����Z�?�P)�Ů�'j˕����*���nz��� b7��?��g�����P�7sx�@�E{$�WW8휲��I�$���z [�ȹqշ÷�&����Pu��$Z�^!s=U���{��Ho<aR�Q؉/�L�|p��@���KF���T�E�Af"dD;��Y��[5�l �C���f�l-]AJ��Z,r������?��m����ϴ��m,ޚ���G-�N����F�E�:c��b�­)I�Cr	����m���y(�IQ�ͦ8�T����Ҏ�~�����1�N%�9����r�^����ܯ$$k�mޔ�(��6��^�ݾA�FD�$��Pes�GKysM�,����Z2E)DѪ� :  Ċ�$^���	HU� �Hk �Ӡ,�74x�@���R�=�X�����!���ִ7�h����Zk���ؐ@v�l�D�}�nH ��Z=&�v�=��;�_�/ [�y�/�������+��A����/�"�	ɚ`���6w3�����?�	�n���ͬ!��yݱ�����D�.?��\�.��[����T?kW!���@��>B��l-�W�v�)��0UڭC��n�

ב:�s����wѨH�kB�U'��%mM�~�8��0n�ZҼ�ݳ�d�q3���d�,���ˀ�]�:IT�D�*�cj��ZRt�ٞ�Rs?߹z�X�±ojЙq���(
���Q?���"���O��l���G��U����;���; �l��b$���y�QФP��G�_�q�TTfZ���Ůi������w���S�'�y�Th��GW��'��"법+G`���O��7�#�T$�V�G]N�� 8'v�)��G���� ��nsI�����U�(�0�ۆ����}�ާ���}����3��d߭|u.���ڕ�'���y�w�w�?�PIF      �   }  x��W�r��]���w^qj�@�%�X�"��5�SIe�41���'xP������H�)�^ŕ�ʹ��@R�"�A��=�t®�ʰ���|g��������X�Y��%[�������w�3�����#Ǳ�0(�AR�l̈́�E�.;3h]��s?�Ȏ��K����l��)+�i�`��_v�����z?u|��`;���<��{�L�D�H�򕟺���;�o̓3Ns_1�*��5�_~���^u�Q��[�<�n����oO�V5Kc	�s`���e_�?vU��`7o�Fu���Zq���z?	ow�th�Kcdl����~���F�W�EM�>����rɂ�<��d7f����4�5��e�YB�CѼ	���2t�_�^��D���\�4	�HB�$a�Oz��ӮW4R	˄\�5��G���&"�ܨ�����7�ߩa���ן%�Dnbq��k��&T�a��a�,�2|�f�d��>Ї�Ԯ�O��M?�ѧd׺����N�d%<��g��+9����;���G�8)KŜ��YR�2[솋E�lM���4�0C0� �2��;��lؕ�;�?ڎߛFcM(�[��X&bE%��j4Gͯ����L3T�ئ��ǨOFWȷ\	�F������l��g��F�GժZ;)
5c�uƝ�C"��x[�N��h��g1v䃔<���]Oè`�������T���7?׬�G܈�`��K�Y\J�����f�r�a}��(Cd�̓���KՍ��0�J��"���Q)�,��qf�f�����~��\�کQ��U���asR?�̥Ѵj��Ϥ ���`&P������y7�X��p�H#�8�V{�4�ӿ��0��ǐ��ҍ��sذwԽa ���t��4�	���D���	����u"�� �0���k��0�.�S?89��� @Ԡ����`K�r����닷����������X/�	�ޔ�u�)a׶ol�=���5�EӉw�'������m�.��ݨ�R�	(&vƶ�{�X�V�J��(�`3Z*�xΡ�� IBk�dl���Mj����Ř�� �$I��$ێZ��c-M�kƁTŹ39{յ���6mK�|sf���0�E�]�GU�V=y�D|��y4C١�4`�� ��ԪgT���UH^�IW�ihS1g[�*��^O�揺�y�l����3o>��G��D��@�8�;~�Da�܌��X��?�i\�,aP�tt�?��: ���U��D�j�{O���v�\�t6�Mo�\u����=��K'n���JM�9��#�W+K٫���+����:
����,�ZU��&��h����9uB��k�y&��hLl0m��Z��~F���>gۓn���ٗ|�$RUV��(�L��Pi�ۙ�R�
GI�M�ȁעE�Xғ�,2!�ԓitf��3r�kTd@M(��A�kH$ӡU��.xc�V$��"�42A��9N��/O'���)��t�,2]��s �K������Q�v��
B�a'�NY*'�(��Y
Ibi�G������$�('�{ $s>�������/^���f�6������b�))C�u��!��l�)�$[.Y�S(��zZ�w�B�ѭ��i�D��a��7v����6�&�;�j$h�|�:Y"(��Һ�Yڛڑ�<b*���aP���Е:�#T�����F����۩�1�خ��i({��7�n08'U���B��M<(i��Sj�& ��u� z(W�̭.`�~Ѝ����ޠ<sw��{#H�Ym���9!Ly3!�V�?��s�K�t�%󕟛��&cg7a�X�7v2�Q��Kt��������������Q<9W��9ٞ�����|q>\�O�$,�B���QS�7��D#|��GKC\�N�qe�~�Wc�fG��B����G�Ħkp	ʮw�Fj����y^�/΃�㽝��9�"&���]ߠqŊ��l��G}|�$��[.����Ǐ��-n6���y�u_�J�'�$�R/7k�;���I�n�aŔ�I a�1�mk4wo?ǯs{��"����A#a���4��-�����pE��z%��UE�'�����:Tk���C��z�D�K����Mc:����� ����W�˭�W��4�{?<'�qHE�_W/^��]�x�      �   [   x�3�.HMM�Tp�((J-.��050�T055յ�06�2���,IMQHL�NLOE�76���2�tKMI-J�Q��,(��KG6�hB� �yQ      �   �  x��W�r��]����T��DOȎ�d��і*.m�@l�f�����I�E�He�U��_9�mkv�r�l��s�=�" �Oʊ��şQr<c�V�rz�Ԓkr��bƌ��`�U�)��H�S�-�X���,�$����8���|>'?ipH�$��s�/�Br�镮9������'���2���k:l���+]rM�BHa�fV!�ʣC�D�,��][d< �)�<���w���<����;�t����f�\0z��C�Ԃ�YInx%$��^��d�jn�_jn��̊���^==(]қ�#)�@O��g�w!DAԅ��Q�s��8wP�䓚���5�O���d3�\0@`w!�{��X0q//�p�T=|vv\�Ț|dK&�O>�E�w��?!]E]�����p�=3W��f� �X%����2ԃN[�R3�NY*��ۚ�7��o�a5���J�R����̐(���L�L �<yF�>M�M`}�n��l�Ы�T; |W�<�4su/�g���re؜9{I����?�q��,Mݥ������8�S�.� w|z�?�v��w���(�2��z�Z�cE��)��a�%:n�4��9of�{)�f�Z��[t��{U#�7���,��T ��k���T5Zrr+
�+��$#���]�ؖ6��^��멟d��2м��$a�FX���[Lԝ�����sz�8��[#nY��\�� ���h�7��٦����y��-5Xp-
dk���� MN1�D��7��<Z�o�
B/�}2�����U�k�Ԫ+n��fϢF]4���6����N�{�?���?2�%-�g� 4�����;!�5�w@lC�$����\:��N2���F,�2�z�����<��$x	!$�uc���Oag!@�u����@`�s��`� t�a���ePC��Q�=2T�n�L@ރ�����cߏ�|'�~�
�$qW���>��uD�ػ2���6�g U^�
U���=X
��d��͇Ns�Kp,���W��Jn�5.��B��1��7O3�O}��i��i��h�,��C�� &0�`U%� )��W{��a��x{n1:��0�㈦	�q�e�,��}���ڹG+Ҿ���G�����b0}��&HLf��Go��������|cΘ������	0]��ق(���G����<��׾듡���t���s�Ĝ�u
_נj'nm{�B5Һ�=žO{4�3:@�����!l�,�����:aK����y��讫����Wt���G��`H.:�0l/��`��w�5[��p���=����T�p^&� �(�}��Kt��m~��t���'�U�9��EQ��?4�b��f�~����R������4N�ucV��t\q%^���ćʷ�9h����E��{��s�ƕ��ʩ�j���P��+%�Cn�t��p[���	s�p[��}�Z+7��_N�����	HW\s:�W��!'�A��I�A�YBB��s��v'A����;�S.��)���\=J���@�d���PѮ]�c?$<ư%p�����8O�x�d���tmD]�K�xe�o��z߽������h4hw���y��E�(����6_����/�"�W*�|��#���=�㦘YN6����-�s�y/o�W��+�1S��/s��/_Pa�v6��sr ;��""�q�-g��GNϸ�ϕD�(o���7t{�m�4��9���v�N�`�tN�Y%���ϓ����J�>�9�v�Q^�k�{�ͤ�������{y�8�r˲�k2Y������CM��O��ޛ��_Nq�F]8m4��"U����N��t
��-8�Z����1k��$�@�a���i����n�.������ύ�2�9>��8�#Y�� �p���n�C���bwg$@m�hJQ�7�l ; ܃)P���������Ż�A��I����7���$%��`�Rր�g͓ k&޶&��|�Հ�̣�Jh��(�`KxV�-�e�������I�,3A�@�/��a��,kY��7���Ὄ:��o���h�9�.�8�2/�{y�����I��{��'�-\�4�֭��Q��H55�o�vg��io����֬͹� �	M'ُ�شv���Ľ�\�tj�y��V���������9�lW���K��=c9�,�N��N����<KQw����6�{ooo��r�'     