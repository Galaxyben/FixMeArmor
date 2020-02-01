// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,cmtg:SF,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,acwp:False,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|normal-6744-OUT,emission-7976-OUT,custl-5779-OUT,olwid-6367-OUT,olcol-7598-OUT;n:type:ShaderForge.SFN_LightColor,id:2673,x:31411,y:33222,varname:node_2673,prsc:2;n:type:ShaderForge.SFN_LightAttenuation,id:3919,x:31217,y:33354,varname:node_3919,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2099,x:31635,y:33280,varname:node_2099,prsc:2|A-2673-RGB,B-4633-OUT,C-2240-RGB;n:type:ShaderForge.SFN_LightVector,id:6848,x:31411,y:32729,varname:node_6848,prsc:2;n:type:ShaderForge.SFN_HalfVector,id:2235,x:31411,y:32466,varname:node_2235,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:2183,x:31411,y:32585,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:4056,x:31629,y:32650,varname:node_4056,prsc:2,dt:1|A-2183-OUT,B-6848-OUT;n:type:ShaderForge.SFN_Dot,id:4104,x:31629,y:32515,varname:node_4104,prsc:2,dt:1|A-2235-OUT,B-2183-OUT;n:type:ShaderForge.SFN_Power,id:3070,x:31851,y:32515,varname:node_3070,prsc:2|VAL-4104-OUT,EXP-1513-OUT;n:type:ShaderForge.SFN_Slider,id:9960,x:31694,y:32297,ptovrint:False,ptlb:SpecularSize,ptin:_SpecularSize,varname:node_9960,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:11;n:type:ShaderForge.SFN_Tex2d,id:4317,x:31411,y:32881,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_4317,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False|UVIN-2954-OUT;n:type:ShaderForge.SFN_Tex2d,id:5499,x:31851,y:32001,ptovrint:False,ptlb:NormalTex,ptin:_NormalTex,varname:node_5499,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True|UVIN-3761-OUT;n:type:ShaderForge.SFN_Vector3,id:1428,x:31851,y:31900,varname:node_1428,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_Lerp,id:331,x:32045,y:32001,varname:node_331,prsc:2|A-1428-OUT,B-5499-RGB,T-928-OUT;n:type:ShaderForge.SFN_Slider,id:928,x:31694,y:32180,ptovrint:False,ptlb:NormalPower,ptin:_NormalPower,varname:node_928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Set,id:3658,x:32207,y:32001,varname:Normal,prsc:2|IN-331-OUT;n:type:ShaderForge.SFN_Color,id:1273,x:31411,y:33067,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_1273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7026,x:31620,y:32979,varname:node_7026,prsc:2|A-4317-RGB,B-1273-RGB;n:type:ShaderForge.SFN_Tex2d,id:2103,x:31921,y:30995,ptovrint:False,ptlb:EmissionTex,ptin:_EmissionTex,varname:node_2103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a0701a55a28f5e74ea610d91857e4606,ntxv:0,isnm:False|UVIN-1256-OUT;n:type:ShaderForge.SFN_Slider,id:2512,x:31767,y:31338,ptovrint:False,ptlb:EmissionPower,ptin:_EmissionPower,varname:node_2512,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:5074,x:32110,y:31173,varname:node_5074,prsc:2|A-1097-OUT,B-6073-RGB,C-2512-OUT;n:type:ShaderForge.SFN_Color,id:6073,x:31924,y:31173,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:node_6073,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Set,id:2799,x:32434,y:31173,varname:Emission,prsc:2|IN-1640-OUT;n:type:ShaderForge.SFN_Multiply,id:7257,x:32241,y:32724,varname:node_7257,prsc:2|A-2036-OUT,B-7026-OUT;n:type:ShaderForge.SFN_Add,id:3659,x:32241,y:32595,varname:node_3659,prsc:2|A-7200-OUT,B-7257-OUT;n:type:ShaderForge.SFN_Multiply,id:5779,x:32450,y:32660,varname:node_5779,prsc:2|A-3659-OUT,B-2099-OUT;n:type:ShaderForge.SFN_Multiply,id:9539,x:32042,y:32515,varname:node_9539,prsc:2|A-3790-OUT,B-3070-OUT;n:type:ShaderForge.SFN_Slider,id:3790,x:32042,y:32395,ptovrint:False,ptlb:SpecularPower,ptin:_SpecularPower,varname:node_3790,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Get,id:6744,x:32414,y:32797,varname:node_6744,prsc:2|IN-3658-OUT;n:type:ShaderForge.SFN_Get,id:7976,x:32414,y:32848,varname:node_7976,prsc:2|IN-2799-OUT;n:type:ShaderForge.SFN_Add,id:1640,x:32282,y:31173,varname:node_1640,prsc:2|A-5074-OUT,B-739-OUT;n:type:ShaderForge.SFN_Set,id:5966,x:31802,y:32979,varname:Diffuse,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Get,id:2576,x:32089,y:31307,varname:node_2576,prsc:2|IN-5966-OUT;n:type:ShaderForge.SFN_Multiply,id:739,x:32282,y:31307,varname:node_739,prsc:2|A-2576-OUT,B-6246-OUT;n:type:ShaderForge.SFN_Exp,id:1513,x:31851,y:32375,varname:node_1513,prsc:2,et:1|IN-9960-OUT;n:type:ShaderForge.SFN_Set,id:1755,x:32593,y:32472,varname:Specular,prsc:2|IN-7200-OUT;n:type:ShaderForge.SFN_Set,id:8352,x:31802,y:32650,varname:LightDirection,prsc:2|IN-4056-OUT;n:type:ShaderForge.SFN_Color,id:2240,x:31411,y:33502,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_2240,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9056604,c2:0.9056604,c3:0.9056604,c4:1;n:type:ShaderForge.SFN_Color,id:8933,x:31924,y:31433,ptovrint:False,ptlb:ShadowColor,ptin:_ShadowColor,varname:_LightColor_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1600659,c2:0.165626,c3:0.3113208,c4:1;n:type:ShaderForge.SFN_Posterize,id:4633,x:31411,y:33354,varname:node_4633,prsc:2|IN-3919-OUT,STPS-3373-OUT;n:type:ShaderForge.SFN_Slider,id:9758,x:31635,y:33444,ptovrint:False,ptlb:Steps,ptin:_Steps,varname:node_9758,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:2,cur:2,max:10;n:type:ShaderForge.SFN_Set,id:8088,x:31952,y:33444,varname:posterizeSteps,prsc:2|IN-9758-OUT;n:type:ShaderForge.SFN_Get,id:3373,x:31196,y:33477,varname:node_3373,prsc:2|IN-8088-OUT;n:type:ShaderForge.SFN_Posterize,id:2036,x:31802,y:32701,varname:node_2036,prsc:2|IN-4056-OUT,STPS-3226-OUT;n:type:ShaderForge.SFN_Get,id:3226,x:31599,y:32795,varname:node_3226,prsc:2|IN-8088-OUT;n:type:ShaderForge.SFN_Posterize,id:976,x:32241,y:32472,varname:node_976,prsc:2|IN-9539-OUT,STPS-9996-OUT;n:type:ShaderForge.SFN_Get,id:9996,x:32021,y:32472,varname:node_9996,prsc:2|IN-8088-OUT;n:type:ShaderForge.SFN_TexCoord,id:5697,x:30137,y:32748,varname:node_5697,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:3079,x:30137,y:32893,varname:node_3079,prsc:2;n:type:ShaderForge.SFN_Multiply,id:3541,x:30329,y:32748,varname:node_3541,prsc:2|A-3079-T,B-7777-OUT;n:type:ShaderForge.SFN_Slider,id:7777,x:29818,y:32785,ptovrint:False,ptlb:MainPannY,ptin:_MainPannY,varname:node_7777,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0,max:10;n:type:ShaderForge.SFN_Panner,id:6510,x:30516,y:32748,varname:node_6510,prsc:2,spu:0,spv:1|UVIN-5697-UVOUT,DIST-3541-OUT;n:type:ShaderForge.SFN_Panner,id:8035,x:30516,y:32603,varname:node_8035,prsc:2,spu:1,spv:0|UVIN-5697-UVOUT,DIST-7731-OUT;n:type:ShaderForge.SFN_Multiply,id:7731,x:30329,y:32603,varname:node_7731,prsc:2|A-3079-T,B-6927-OUT;n:type:ShaderForge.SFN_Slider,id:6927,x:29980,y:32655,ptovrint:False,ptlb:MainPannX,ptin:_MainPannX,varname:node_6927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0,max:10;n:type:ShaderForge.SFN_Add,id:345,x:30706,y:32681,varname:node_345,prsc:2|A-8035-UVOUT,B-6510-UVOUT;n:type:ShaderForge.SFN_Divide,id:6125,x:30885,y:32681,varname:node_6125,prsc:2|A-345-OUT,B-1719-OUT;n:type:ShaderForge.SFN_Vector1,id:1719,x:30706,y:32811,varname:node_1719,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:6427,x:30329,y:33038,varname:node_6427,prsc:2|A-3079-T,B-8126-OUT;n:type:ShaderForge.SFN_Slider,id:8126,x:29980,y:33045,ptovrint:False,ptlb:EmissionPannX,ptin:_EmissionPannX,varname:_MainPannY_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0,max:10;n:type:ShaderForge.SFN_Panner,id:9332,x:30516,y:33038,varname:node_9332,prsc:2,spu:0,spv:1|UVIN-5697-UVOUT,DIST-6427-OUT;n:type:ShaderForge.SFN_Panner,id:435,x:30516,y:32893,varname:node_435,prsc:2,spu:1,spv:0|UVIN-5697-UVOUT,DIST-5001-OUT;n:type:ShaderForge.SFN_Multiply,id:5001,x:30329,y:32893,varname:node_5001,prsc:2|A-3079-T,B-7097-OUT;n:type:ShaderForge.SFN_Slider,id:7097,x:29818,y:32894,ptovrint:False,ptlb:EmissionPannY,ptin:_EmissionPannY,varname:_MainPannX_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-10,cur:0,max:10;n:type:ShaderForge.SFN_Add,id:604,x:30706,y:32971,varname:node_604,prsc:2|A-435-UVOUT,B-9332-UVOUT;n:type:ShaderForge.SFN_Divide,id:9574,x:30885,y:32971,varname:node_9574,prsc:2|A-604-OUT,B-924-OUT;n:type:ShaderForge.SFN_Vector1,id:924,x:30706,y:33101,varname:node_924,prsc:2,v1:2;n:type:ShaderForge.SFN_Set,id:7165,x:31042,y:32681,varname:MainPann,prsc:2|IN-6125-OUT;n:type:ShaderForge.SFN_Set,id:2164,x:31049,y:32971,varname:EmissionPann,prsc:2|IN-9574-OUT;n:type:ShaderForge.SFN_Get,id:2954,x:31232,y:32881,varname:node_2954,prsc:2|IN-7165-OUT;n:type:ShaderForge.SFN_Get,id:3761,x:31674,y:32001,varname:node_3761,prsc:2|IN-7165-OUT;n:type:ShaderForge.SFN_Get,id:1256,x:31750,y:30995,varname:node_1256,prsc:2|IN-2164-OUT;n:type:ShaderForge.SFN_Posterize,id:1097,x:32110,y:30995,varname:node_1097,prsc:2|IN-2103-RGB,STPS-3499-OUT;n:type:ShaderForge.SFN_Get,id:3499,x:31900,y:30927,varname:node_3499,prsc:2|IN-8088-OUT;n:type:ShaderForge.SFN_Color,id:9616,x:32352,y:33008,ptovrint:False,ptlb:OutlineColor,ptin:_OutlineColor,varname:node_9616,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Slider,id:6367,x:32195,y:33254,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_6367,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.02,max:1;n:type:ShaderForge.SFN_Slider,id:2878,x:32195,y:33169,ptovrint:False,ptlb:OutlineGlow,ptin:_OutlineGlow,varname:node_2878,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:7598,x:32522,y:33008,varname:node_7598,prsc:2|A-9616-RGB,B-2878-OUT;n:type:ShaderForge.SFN_Multiply,id:5093,x:31635,y:33151,varname:node_5093,prsc:2|A-2673-RGB,B-2240-RGB;n:type:ShaderForge.SFN_Set,id:6042,x:31795,y:33151,varname:CustomLight,prsc:2|IN-5093-OUT;n:type:ShaderForge.SFN_Tex2d,id:9865,x:32089,y:31580,ptovrint:False,ptlb:ShadowTex,ptin:_ShadowTex,varname:node_9865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a0701a55a28f5e74ea610d91857e4606,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Set,id:9302,x:31217,y:33294,varname:LightAttenuation,prsc:2|IN-3919-OUT;n:type:ShaderForge.SFN_Lerp,id:1649,x:32089,y:31433,varname:node_1649,prsc:2|A-7803-OUT,B-8933-RGB,T-9865-RGB;n:type:ShaderForge.SFN_Lerp,id:6246,x:32282,y:31433,varname:node_6246,prsc:2|A-1649-OUT,B-1168-OUT,T-734-OUT;n:type:ShaderForge.SFN_Vector1,id:1168,x:32089,y:31380,varname:node_1168,prsc:2,v1:0;n:type:ShaderForge.SFN_Get,id:2611,x:32033,y:31777,varname:node_2611,prsc:2|IN-8352-OUT;n:type:ShaderForge.SFN_Get,id:7151,x:32033,y:31824,varname:node_7151,prsc:2|IN-9302-OUT;n:type:ShaderForge.SFN_Multiply,id:6422,x:32217,y:31788,varname:node_6422,prsc:2|A-2611-OUT,B-7151-OUT;n:type:ShaderForge.SFN_Posterize,id:734,x:32388,y:31788,varname:node_734,prsc:2|IN-6422-OUT,STPS-9951-OUT;n:type:ShaderForge.SFN_Get,id:9951,x:32196,y:31915,varname:node_9951,prsc:2|IN-8088-OUT;n:type:ShaderForge.SFN_Get,id:7803,x:31903,y:31580,varname:node_7803,prsc:2|IN-6042-OUT;n:type:ShaderForge.SFN_Color,id:7519,x:32410,y:32327,ptovrint:False,ptlb:SpecularColor,ptin:_SpecularColor,varname:node_7519,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:7200,x:32410,y:32472,varname:node_7200,prsc:2|A-7519-RGB,B-976-OUT;proporder:9960-4317-1273-3790-5499-928-2103-2512-6073-2240-8933-9758-7777-6927-8126-7097-6367-9616-2878-9865-7519;pass:END;sub:END;*/

Shader "Retus001/CellShadedReborn" {
    Properties {
        _SpecularSize ("SpecularSize", Range(0, 11)) = 0
        _MainTex ("MainTex", 2D) = "white" {}
        _MainColor ("MainColor", Color) = (1,1,1,1)
        _SpecularPower ("SpecularPower", Range(0, 10)) = 0
        _NormalTex ("NormalTex", 2D) = "bump" {}
        _NormalPower ("NormalPower", Range(0, 1)) = 0.5
        _EmissionTex ("EmissionTex", 2D) = "white" {}
        _EmissionPower ("EmissionPower", Range(0, 10)) = 0
        _EmissionColor ("EmissionColor", Color) = (1,1,1,1)
        _LightColor ("LightColor", Color) = (0.9056604,0.9056604,0.9056604,1)
        _ShadowColor ("ShadowColor", Color) = (0.1600659,0.165626,0.3113208,1)
        _Steps ("Steps", Range(2, 10)) = 2
        _MainPannY ("MainPannY", Range(-10, 10)) = 0
        _MainPannX ("MainPannX", Range(-10, 10)) = 0
        _EmissionPannX ("EmissionPannX", Range(-10, 10)) = 0
        _EmissionPannY ("EmissionPannY", Range(-10, 10)) = 0
        _OutlineWidth ("OutlineWidth", Range(0, 1)) = 0.02
        _OutlineColor ("OutlineColor", Color) = (0,0,0,1)
        _OutlineGlow ("OutlineGlow", Range(0, 10)) = 0
        _ShadowTex ("ShadowTex", 2D) = "white" {}
        _SpecularColor ("SpecularColor", Color) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
            "CustomTag"="SF"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _OutlineColor;
            uniform float _OutlineWidth;
            uniform float _OutlineGlow;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + normalize(v.vertex)*_OutlineWidth,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4((_OutlineColor.rgb*_OutlineGlow),0);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #if !UNITY_PASS_FORWARDBASE
            #define UNITY_PASS_FORWARDBASE
            #endif
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _SpecularSize;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform float _NormalPower;
            uniform float4 _MainColor;
            uniform sampler2D _EmissionTex; uniform float4 _EmissionTex_ST;
            uniform float _EmissionPower;
            uniform float4 _EmissionColor;
            uniform float _SpecularPower;
            uniform float4 _LightColor;
            uniform float4 _ShadowColor;
            uniform float _Steps;
            uniform float _MainPannY;
            uniform float _MainPannX;
            uniform float _EmissionPannX;
            uniform float _EmissionPannY;
            uniform sampler2D _ShadowTex; uniform float4 _ShadowTex_ST;
            uniform float4 _SpecularColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_3079 = _Time;
                float2 MainPann = (((i.uv0+(node_3079.g*_MainPannX)*float2(1,0))+(i.uv0+(node_3079.g*_MainPannY)*float2(0,1)))/2.0);
                float2 node_3761 = MainPann;
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(node_3761, _NormalTex)));
                float3 Normal = lerp(float3(0,0,1),_NormalTex_var.rgb,_NormalPower);
                float3 normalLocal = Normal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation, i, i.posWorld.xyz);
////// Emissive:
                float2 EmissionPann = (((i.uv0+(node_3079.g*_EmissionPannY)*float2(1,0))+(i.uv0+(node_3079.g*_EmissionPannX)*float2(0,1)))/2.0);
                float2 node_1256 = EmissionPann;
                float4 _EmissionTex_var = tex2D(_EmissionTex,TRANSFORM_TEX(node_1256, _EmissionTex));
                float posterizeSteps = _Steps;
                float node_3499 = posterizeSteps;
                float2 node_2954 = MainPann;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2954, _MainTex));
                float3 node_7026 = (_MainTex_var.rgb*_MainColor.rgb);
                float3 Diffuse = node_7026;
                float3 CustomLight = (_LightColor0.rgb*_LightColor.rgb);
                float3 node_7803 = CustomLight;
                float4 _ShadowTex_var = tex2D(_ShadowTex,TRANSFORM_TEX(i.uv0, _ShadowTex));
                float node_1168 = 0.0;
                float node_4056 = max(0,dot(normalDirection,lightDirection));
                float LightDirection = node_4056;
                float LightAttenuation = attenuation;
                float node_9951 = posterizeSteps;
                float3 Emission = ((floor(_EmissionTex_var.rgb * node_3499) / (node_3499 - 1)*_EmissionColor.rgb*_EmissionPower)+(Diffuse*lerp(lerp(node_7803,_ShadowColor.rgb,_ShadowTex_var.rgb),float3(node_1168,node_1168,node_1168),floor((LightDirection*LightAttenuation) * node_9951) / (node_9951 - 1))));
                float3 emissive = Emission;
                float node_9996 = posterizeSteps;
                float3 node_7200 = (_SpecularColor.rgb*floor((_SpecularPower*pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecularSize))) * node_9996) / (node_9996 - 1));
                float node_3226 = posterizeSteps;
                float node_3373 = posterizeSteps;
                float3 finalColor = emissive + ((node_7200+(floor(node_4056 * node_3226) / (node_3226 - 1)*node_7026))*(_LightColor0.rgb*floor(attenuation * node_3373) / (node_3373 - 1)*_LightColor.rgb));
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #if !UNITY_PASS_FORWARDADD
            #define UNITY_PASS_FORWARDADD
            #endif
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _SpecularSize;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform float _NormalPower;
            uniform float4 _MainColor;
            uniform sampler2D _EmissionTex; uniform float4 _EmissionTex_ST;
            uniform float _EmissionPower;
            uniform float4 _EmissionColor;
            uniform float _SpecularPower;
            uniform float4 _LightColor;
            uniform float4 _ShadowColor;
            uniform float _Steps;
            uniform float _MainPannY;
            uniform float _MainPannX;
            uniform float _EmissionPannX;
            uniform float _EmissionPannY;
            uniform sampler2D _ShadowTex; uniform float4 _ShadowTex_ST;
            uniform float4 _SpecularColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_3079 = _Time;
                float2 MainPann = (((i.uv0+(node_3079.g*_MainPannX)*float2(1,0))+(i.uv0+(node_3079.g*_MainPannY)*float2(0,1)))/2.0);
                float2 node_3761 = MainPann;
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(node_3761, _NormalTex)));
                float3 Normal = lerp(float3(0,0,1),_NormalTex_var.rgb,_NormalPower);
                float3 normalLocal = Normal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                UNITY_LIGHT_ATTENUATION(attenuation, i, i.posWorld.xyz);
                float posterizeSteps = _Steps;
                float node_9996 = posterizeSteps;
                float3 node_7200 = (_SpecularColor.rgb*floor((_SpecularPower*pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecularSize))) * node_9996) / (node_9996 - 1));
                float node_4056 = max(0,dot(normalDirection,lightDirection));
                float node_3226 = posterizeSteps;
                float2 node_2954 = MainPann;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2954, _MainTex));
                float3 node_7026 = (_MainTex_var.rgb*_MainColor.rgb);
                float node_3373 = posterizeSteps;
                float3 finalColor = ((node_7200+(floor(node_4056 * node_3226) / (node_3226 - 1)*node_7026))*(_LightColor0.rgb*floor(attenuation * node_3373) / (node_3373 - 1)*_LightColor.rgb));
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
