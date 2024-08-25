%
% Function locons: defines boundary conditions (loads and constraints)
%
function [nCons,dC,nForce,dF,npq,dpq,fx,fy]=locons(dXY,thickness)

 % Load matrix dF: 
 % the i-th row of dF collects: the number of the loaded node; 
 %                                      the force direction; 
 %                                      the force intensity.
 % dF(i,1)=node number;
 % dF(i,2)=loaded direction ("1" along "x", "2" along "y");
 % dF(i,3)=action intensity.

 % dF=[1,1,10000];
 
  dF=[]; % in our model no concentraded forces 
  
% %   [nForce,nn]=size(dF);  % nForce=total number of considered loads
% inserted as final step in order to include also the equivalent one

 % Constraint matrix dC: 
 % the i-th row in dC collects: the number of the constrained node; 
 %                                      the direction of the constrained dof; 
 %                                      the magnitude of the imposed displacement.
 % dC(i,1)=node number;
 % dC(i,2)=constrained dof ("1" along "x", "2" along "y");
 % dC(i,3)=magnitude of the imposed displacement.

% %%%Fine mash only mansory [mm]
%   dC=   [1,1,0;
% 25,1,0;
% 48,1,0;
% 71,1,0;
% 94,1,0;
% 117,1,0;
% 140,1,0;
% 1,2,0;
% 25,2,0;
% 48,2,0;
% 71,2,0;
% 94,2,0;
% 117,2,0;
% 140,2,0];
       
%%%Rough mash with concrete [mm]  
  dC=   [1,1,0;
26,1,0;
51,1,0;
76,1,0;
101,1,0;
126,1,0;
151,1,0;
176,1,0;
201,1,0;
226,1,0;
251,1,0;
1,2,0;
26,2,0;
51,2,0;
76,2,0;
101,2,0;
126,2,0;
151,2,0;
176,2,0;
201,2,0;
226,2,0;
251,2,0];

  [nCons,nn]=size(dC);  % nCons=total number of constrained dofs
  
 % Distributed load matrix dpq: 
 % the i-th row of dpq collects: the number of the loaded element; 
 %                               the uniform load in x direction; 
 %                               the uniform load in y direction.

% %%%Rough mash only mansory [mm]
%   dpq=[1,0,-0.000021;
% 2,0,-0.000021;
% 3,0,-0.000021;
% 4,0,-0.000021;
% 5,0,-0.000021;
% 6,0,-0.000021;
% 7,0,-0.000021;
% 8,0,-0.000021;
% 9,0,-0.000021;
% 10,0,-0.000021;
% 11,0,-0.000021;
% 12,0,-0.000021;
% 13,0,-0.000021;
% 14,0,-0.000021;
% 15,0,-0.000021;
% 16,0,-0.000021;
% 17,0,-0.000021;
% 18,0,-0.000021;
% 19,0,-0.000021;
% 20,0,-0.000021;
% 21,0,-0.000021;
% 22,0,-0.000021;
% 23,0,-0.000021;
% 24,0,-0.000021;
% 25,0,-0.000021;
% 26,0,-0.000021;
% 27,0,-0.000021;
% 28,0,-0.000021;
% 29,0,-0.000021;
% 30,0,-0.000021;
% 31,0,-0.000021;
% 32,0,-0.000021;
% 33,0,-0.000021;
% 34,0,-0.000021;
% 35,0,-0.000021;
% 36,0,-0.000021;
% 37,0,-0.000021;
% 38,0,-0.000021;
% 39,0,-0.000021;
% 40,0,-0.000021;
% 41,0,-0.000021;
% 42,0,-0.000021;
% 43,0,-0.000021;
% 44,0,-0.000021;
% 45,0,-0.000021;
% 46,0,-0.000021;
% 47,0,-0.000021;
% 48,0,-0.000021;
% 49,0,-0.000021;
% 50,0,-0.000021;
% 51,0,-0.000021;
% 52,0,-0.000021;
% 53,0,-0.000021;
% 54,0,-0.000021;
% 55,0,-0.000021;
% 56,0,-0.000021;
% 57,0,-0.000021;
% 58,0,-0.000021;
% 59,0,-0.000021;
% 60,0,-0.000021;
% 61,0,-0.000021;
% 62,0,-0.000021;
% 63,0,-0.000021;
% 64,0,-0.000021;
% 65,0,-0.000021;
% 66,0,-0.000021;
% 67,0,-0.000021;
% 68,0,-0.000021;
% 69,0,-0.000021;
% 70,0,-0.000021;
% 71,0,-0.000021;
% 72,0,-0.000021;
% 73,0,-0.000021;
% 74,0,-0.000021;
% 75,0,-0.000021;
% 76,0,-0.000021;
% 77,0,-0.000021;
% 78,0,-0.000021;
% 79,0,-0.000021;
% 80,0,-0.000021;
% 81,0,-0.000021;
% 82,0,-0.000021;
% 83,0,-0.000021;
% 84,0,-0.000021;
% 85,0,-0.000021;
% 86,0,-0.000021;
% 87,0,-0.000021;
% 88,0,-0.000021;
% 89,0,-0.000021;
% 90,0,-0.000021;
% 91,0,-0.000021;
% 92,0,-0.000021;
% 93,0,-0.000021;
% 94,0,-0.000021;
% 95,0,-0.000021;
% 96,0,-0.000021;
% 97,0,-0.000021;
% 98,0,-0.000021;
% 99,0,-0.000021;
% 100,0,-0.000021;
% 101,0,-0.000021;
% 102,0,-0.000021;
% 103,0,-0.000021;
% 104,0,-0.000021;
% 105,0,-0.000021;
% 106,0,-0.000021;
% 107,0,-0.000021;
% 108,0,-0.000021;
% 109,0,-0.000021;
% 110,0,-0.000021;
% 111,0,-0.000021;
% 112,0,-0.000021;
% 113,0,-0.000021;
% 114,0,-0.000021;
% 115,0,-0.000021;
% 116,0,-0.000021;
% 117,0,-0.000021;
% 118,0,-0.000021;
% 119,0,-0.000021;
% 120,0,-0.000021;
% 121,0,-0.000021;
% 122,0,-0.000021;
% 123,0,-0.000021;
% 124,0,-0.000021;
% 125,0,-0.000021;
% 126,0,-0.000021;
% 127,0,-0.000021;
% 128,0,-0.000021;
% 129,0,-0.000021;
% 130,0,-0.000021;
% 131,0,-0.000021;
% 132,0,-0.000021];

%%%Rough mash with concrete [mm]  
  dpq=[1,0,-0.000021;
2,0,-0.000021;
3,0,-0.000021;
4,0,-0.000021;
5,0,-0.000021;
6,0,-0.000021;
7,0,-0.000021;
8,0,-0.000021;
9,0,-0.000021;
10,0,-0.000021;
11,0,-0.000021;
12,0,-0.000021;
13,0,-0.000021;
14,0,-0.000021;
15,0,-0.000021;
16,0,-0.000021;
17,0,-0.000021;
18,0,-0.000021;
19,0,-0.000021;
20,0,-0.000021;
21,0,-0.000021;
22,0,-0.000021;
23,0,-0.000021;
24,0,-0.000021;
25,0,-0.000021;
26,0,-0.000021;
27,0,-0.000021;
28,0,-0.000021;
29,0,-0.000021;
30,0,-0.000021;
31,0,-0.000021;
32,0,-0.000021;
33,0,-0.000021;
34,0,-0.000021;
35,0,-0.000021;
36,0,-0.000021;
37,0,-0.000021;
38,0,-0.000021;
39,0,-0.000021;
40,0,-0.000021;
41,0,-0.000021;
42,0,-0.000021;
43,0,-0.000021;
44,0,-0.000021;
45,0,-0.000021;
46,0,-0.000021;
47,0,-0.000021;
48,0,-0.000021;
49,0,-0.000021;
50,0,-0.000021;
51,0,-0.000021;
52,0,-0.000021;
53,0,-0.000021;
54,0,-0.000021;
55,0,-0.000021;
56,0,-0.000021;
57,0,-0.000021;
58,0,-0.000021;
59,0,-0.000021;
60,0,-0.000021;
61,0,-0.000021;
62,0,-0.000021;
63,0,-0.000021;
64,0,-0.000021;
65,0,-0.000021;
66,0,-0.000021;
67,0,-0.000021;
68,0,-0.000021;
69,0,-0.000021;
70,0,-0.000021;
71,0,-0.000021;
72,0,-0.000021;
73,0,-0.000021;
74,0,-0.000021;
75,0,-0.000021;
76,0,-0.000021;
77,0,-0.000021;
78,0,-0.000021;
79,0,-0.000021;
80,0,-0.000021;
81,0,-0.000021;
82,0,-0.000021;
83,0,-0.000021;
84,0,-0.000021;
85,0,-0.000021;
86,0,-0.000021;
87,0,-0.000021;
88,0,-0.000021;
89,0,-0.000021;
90,0,-0.000021;
91,0,-0.000021;
92,0,-0.000021;
93,0,-0.000021;
94,0,-0.000021;
95,0,-0.000021;
96,0,-0.000021;
97,0,-0.000021;
98,0,-0.000021;
99,0,-0.000021;
100,0,-0.000021;
101,0,-0.000021;
102,0,-0.000021;
103,0,-0.000021;
104,0,-0.000021;
105,0,-0.000021;
106,0,-0.000021;
107,0,-0.000021;
108,0,-0.000021;
109,0,-0.000021;
110,0,-0.000021;
111,0,-0.000021;
112,0,-0.000021;
113,0,-0.000021;
114,0,-0.000021;
115,0,-0.000021;
116,0,-0.000021;
117,0,-0.000021;
118,0,-0.000021;
119,0,-0.000021;
120,0,-0.000021;
121,0,-0.000021;
122,0,-0.000021;
123,0,-0.000021;
124,0,-0.000021;
125,0,-0.000021;
126,0,-0.000021;
127,0,-0.000021;
128,0,-0.000021;
129,0,-0.000021;
130,0,-0.000021;
131,0,-0.000021;
132,0,-0.000021;
133,0,-0.000024;
134,0,-0.000024;
135,0,-0.000024;
136,0,-0.000024;
137,0,-0.000024;
138,0,-0.000024;
139,0,-0.000024;
140,0,-0.000024;
141,0,-0.000024;
142,0,-0.000024;
143,0,-0.000024;
144,0,-0.000024;
145,0,-0.000024;
146,0,-0.000024;
147,0,-0.000024;
148,0,-0.000024;
149,0,-0.000024;
150,0,-0.000024;
151,0,-0.000024;
152,0,-0.000024;
153,0,-0.000024;
154,0,-0.000024;
155,0,-0.000024;
156,0,-0.000024;
157,0,-0.000024;
158,0,-0.000024;
159,0,-0.000024;
160,0,-0.000024;
161,0,-0.000024;
162,0,-0.000024;
163,0,-0.000024;
164,0,-0.000024;
165,0,-0.000024;
166,0,-0.000024;
167,0,-0.000024;
168,0,-0.000024;
169,0,-0.000024;
170,0,-0.000024;
171,0,-0.000024;
172,0,-0.000024;
173,0,-0.000024;
174,0,-0.000024;
175,0,-0.000024;
176,0,-0.000024;
177,0,-0.000024;
178,0,-0.000024;
179,0,-0.000024;
180,0,-0.000024;
181,0,-0.000024;
182,0,-0.000024;
183,0,-0.000024;
184,0,-0.000024;
185,0,-0.000024;
186,0,-0.000024;
187,0,-0.000024;
188,0,-0.000024;
189,0,-0.000024;
190,0,-0.000024;
191,0,-0.000024;
192,0,-0.000024;
193,0,-0.000024;
194,0,-0.000024;
195,0,-0.000024;
196,0,-0.000024;
197,0,-0.000024;
198,0,-0.000024;
199,0,-0.000024;
200,0,-0.000024;
201,0,-0.000024;
202,0,-0.000024;
203,0,-0.000024;
204,0,-0.000024;
205,0,-0.000024;
206,0,-0.000024;
207,0,-0.000024;
208,0,-0.000024;
209,0,-0.000024;
210,0,-0.000024;
211,0,-0.000024;
212,0,-0.000024;
213,0,-0.000024;
214,0,-0.000024;
215,0,-0.000024;
216,0,-0.000024;
217,0,-0.000024;
218,0,-0.000024;
219,0,-0.000024;
220,0,-0.000024;
221,0,-0.000024;
222,0,-0.000024;
223,0,-0.000024;
224,0,-0.000024;
225,0,-0.000024;
226,0,-0.000024;
227,0,-0.000024;
228,0,-0.000024;
229,0,-0.000024;
230,0,-0.000024;
231,0,-0.000024;
232,0,-0.000024;
233,0,-0.000024;
234,0,-0.000024;
235,0,-0.000024;
236,0,-0.000024;
237,0,-0.000024;
238,0,-0.000024;
239,0,-0.000024;
240,0,-0.000024];

  [npq,nn]=size(dpq);  % npq=total number of considered loads

  %% computing of the surface load (modification to use also distribuited load)
%   define a matrix able to collect the sourface loads in x direction,ydirection 

%% NOTE! only for the hydrostatic case like our, in opposite insert directly the two matrices fx and fy
% THAT WE ARE INSERTING AS LOAD THE HYDROSTATIC ONE DISTRIBUTED ONLY ON THE 
% POINTS OF THE LEFT BORDER so the force will go down (on Y all negative) and to right (on X all positive);
% IF YOU NEED TO INSERT OTHER LOAD INSERT IT MANUALLY 

%inserted manually
%     fx=[1,74,0.45126,0.40588875;
%         74,8,0.40588875,0.3605175;
%         8,9,0.3605175,0.31514625;
%         9,12,0.31514625,0.269775;
%         12,14,0.269775,0.22440375;
%         14,16,0.22440375,0.1790325;
%         16,18,0.1790325,0.13366125;
%         18,2,0.13366125,0.08829;
%         2,21,0.08829,0.0522385443;
%         21,23,0.0522385443,0.019981989;
%         23,25,0.019981989,0];
%     fy=[ 1,74,-0.45126,-0.40588875;
%         74,8,-0.40588875,-0.3605175;
%         8,9,-0.3605175,-0.31514625;
%         9,12,-0.31514625,-0.269775;
%         12,14,-0.269775,-0.22440375;
%         14,16,-0.22440375,-0.1790325;
%         16,18,-0.1790325,-0.13366125;
%         18,2,-0.13366125,-0.08829;
%         2,21,-0.08829,-0.0522385443;
%         21,23,-0.0522385443,-0.019981989;
%         23,25,-0.019981989,0];
%    



 gamma_water=0.00000981;   %specific_weight_water n/mm^3
 fx=[];
 fy=[];
 %  number of the nodes in contact with the water

%%%Fine mash only mansory [mm] 
node_water=[1,19]; % first and last point of the edge in contact with water first the bottom point than the upper 
 
%  %%%Rough mash with concrete [mm]  
%  node_water=[45,53]; % first and last point of the edge in contact with water first the bottom point than the upper 

 Hw=50500; % y coordinates of the water table mm
for kk=node_water(1):node_water(2)-1
    fx=[fx;kk,kk+1,gamma_water*(Hw-dXY(kk,2)),gamma_water*(Hw-dXY(kk+1,2))];  % distribuited x load on the side between nodes indicated in node water, evaluated  each node
    fy=[fy;kk,kk+1,-gamma_water*(Hw-dXY(kk,2)),-gamma_water*(Hw-dXY(kk+1,2))]; % distribuited y load on the side between nodes indicated in node water, evaluated  each node
end
% fx will be a matrix with one row for each horizontal surface load (so the number of 
% point in contact with water will be 1 more than the surface in contact with water) with
%         - node1,node2,value_in_node1,value_in_node2
% consider to give the numeration with the first node the lower in terms of
% y and the second the higher

% fy will be a matrix with one row for each vertical surface load with
%         - node1,node2,value_in_node1,value_in_node2

%% computing for each nodes the equivalent contribution due to the surface ditributed load to insert into dF
dF_eq_vert=zeros(size(fx,1),4); % node1 equivalent force 1 node2 equivalent force 2     % orizontal equivalent contribution of the jj loaded side 
for jj=1:size(fx,1)
    node1=fx(jj,1); %node1 of the jj-th beam
    force1=fx(jj,3); %value of the distributed force in node1 of the jj-th beam
    node2=fx(jj,2); %node1 of the jj-th beam
    force2=fx(jj,4); %value of the distributed force in node2 of the jj-th beam
    dF_eq_oriz(jj,1)=node1; %node1
    dF_eq_oriz(jj,2)=(2*force1+force2)*abs(dXY(node1,2)-dXY(node2,2))*thickness/6; % equivalent force node1 
    dF_eq_oriz(jj,3)=node2; %node2
    dF_eq_oriz(jj,4)=(force1+2*force2)*abs(dXY(node1,2)-dXY(node2,2))*thickness/6; % equivalent force node2 
    dF=[dF;...
        node1,1,dF_eq_oriz(jj,2);...
        node2,1,dF_eq_oriz(jj,4)]; %collecting the contributes of node 1 and 2 in dF
end

dF_eq_vert=zeros(size(fy,1),4);
for ll=1:size(fy,1)
    node1=fy(ll,1); %node1 of the jj-th beam
    force1=fy(ll,3); %value of the distributed force in node1 of the jj-th beam
    node2=fy(ll,2); %node1 of the jj-th beam
    force2=fy(ll,4); %value of the distributed force in node2 of the jj-th beam
    dF_eq_vert(ll,1)=node1; %node1
    dF_eq_vert(ll,2)=(2*force1+force2)*abs(dXY(node1,1)-dXY(node2,1))*thickness/6; % equivalent force node1 
    dF_eq_vert(ll,3)=node2; %node2
    dF_eq_vert(ll,4)=(force1+2*force2)*abs(dXY(node1,1)-dXY(node2,1))*thickness/6; % equivalent force node2 
    dF=[dF;...
        node1,2,dF_eq_vert(ll,2);...
        node2,2,dF_eq_vert(ll,4)]; %collecting the contributes of node 1 and 2 in dF
end

[nForce,nn]=size(dF);  % nForce=total number of considered loads



 

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
