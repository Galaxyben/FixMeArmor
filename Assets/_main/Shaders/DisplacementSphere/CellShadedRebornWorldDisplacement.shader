// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge

//This was manually altered

Shader "Retus001ftNgak/CellShadedDisplacement" {
    Properties {
        _SpecularSize ("SpecularSize", Range(0, 11)) = 0
        _MainTex ("MainTex", 2D) = "white" {}
        [PreRendererData] _MainColor ("MainColor", Color) = (1,1,1,1)
        _SpecularPower ("SpecularPower", Range(0, 10)) = 0
        _NormalTex ("NormalTex", 2D) = "bump" {}
        _NormalPower ("NormalPower", Range(0, 1)) = 0.5
        _EmissionTex ("EmissionTex", 2D) = "white" {}
        [PreRendererData] _EmissionPower ("EmissionPower", Range(0, 10)) = 0
        [PreRendererData] _EmissionColor ("EmissionColor", Color) = (1,1,1,1)
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
        _DisplacementIntensity ("DisplacementIntensity", Range(0, 5)) = 0.2
        _Noise3DTiling ("Noise3DTiling", Range(0, 1000)) = 1
        [PreRendererData] _LocalPosition("LocalPosition", Vector) = (1,1,1,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "SimplexNoise3D.hlsl"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            float3 displacement( float3 pos , float intensity , float tiling , float3 normal ){
                return snoise(pos*tiling) * intensity * normal;
            }
            
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _OutlineColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _OutlineWidth)
                UNITY_DEFINE_INSTANCED_PROP( float, _OutlineGlow)
                UNITY_DEFINE_INSTANCED_PROP( float, _DisplacementIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _Noise3DTiling)
                UNITY_DEFINE_INSTANCED_PROP(float4, _LocalPosition)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _DisplacementIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DisplacementIntensity );
                float _Noise3DTiling_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Noise3DTiling );
                float4 _LocalPosition_var = UNITY_ACCESS_INSTANCED_PROP(Props, _LocalPosition);
                v.vertex.xyz += displacement(v.vertex.rgb + _LocalPosition_var, _DisplacementIntensity_var, _Noise3DTiling_var, v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float _OutlineWidth_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineWidth );
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + normalize(v.vertex)*_OutlineWidth_var,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float4 _OutlineColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineColor );
                float _OutlineGlow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OutlineGlow );
                return fixed4((_OutlineColor_var.rgb*_OutlineGlow_var),0);
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "SimplexNoise3D.hlsl"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _EmissionTex; uniform float4 _EmissionTex_ST;
            uniform sampler2D _ShadowTex; uniform float4 _ShadowTex_ST;
            float3 displacement( float3 pos , float intensity , float tiling , float3 normal ){
            return snoise(pos*tiling) * intensity * normal;
            }
            
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularSize)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EmissionColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ShadowColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Steps)
                UNITY_DEFINE_INSTANCED_PROP( float, _MainPannY)
                UNITY_DEFINE_INSTANCED_PROP( float, _MainPannX)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPannX)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPannY)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecularColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _DisplacementIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _Noise3DTiling)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LocalPosition)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float _DisplacementIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DisplacementIntensity );
                float _Noise3DTiling_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Noise3DTiling );
                float4 _LocalPosition_var = UNITY_ACCESS_INSTANCED_PROP(Props, _LocalPosition);
                v.vertex.xyz += displacement(v.vertex.rgb + _LocalPosition_var, _DisplacementIntensity_var, _Noise3DTiling_var, v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_3079 = _Time;
                float _MainPannX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainPannX );
                float _MainPannY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainPannY );
                float2 MainPann = (((i.uv0+(node_3079.g*_MainPannX_var)*float2(1,0))+(i.uv0+(node_3079.g*_MainPannY_var)*float2(0,1)))/2.0);
                float2 node_3761 = MainPann;
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(node_3761, _NormalTex)));
                float _NormalPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalPower );
                float3 Normal = lerp(float3(0,0,1),_NormalTex_var.rgb,_NormalPower_var);
                float3 normalLocal = Normal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float _EmissionPannY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EmissionPannY );
                float _EmissionPannX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EmissionPannX );
                float2 EmissionPann = (((i.uv0+(node_3079.g*_EmissionPannY_var)*float2(1,0))+(i.uv0+(node_3079.g*_EmissionPannX_var)*float2(0,1)))/2.0);
                float2 node_1256 = EmissionPann;
                float4 _EmissionTex_var = tex2D(_EmissionTex,TRANSFORM_TEX(node_1256, _EmissionTex));
                float _Steps_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Steps );
                float posterizeSteps = _Steps_var;
                float node_3499 = posterizeSteps;
                float4 _EmissionColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EmissionColor );
                float _EmissionPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EmissionPower );
                float2 node_2954 = MainPann;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2954, _MainTex));
                float4 _MainColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainColor );
                float3 node_7026 = (_MainTex_var.rgb*_MainColor_var.rgb);
                float3 Diffuse = node_7026;
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float3 CustomLight = (_LightColor0.rgb*_LightColor_var.rgb);
                float4 _ShadowColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _ShadowColor );
                float4 _ShadowTex_var = tex2D(_ShadowTex,TRANSFORM_TEX(i.uv0, _ShadowTex));
                float node_1168 = 0.0;
                float node_4056 = max(0,dot(normalDirection,lightDirection));
                float LightDirection = node_4056;
                float LightAttenuation = attenuation;
                float node_9951 = posterizeSteps;
                float3 Emission = ((floor(_EmissionTex_var.rgb * node_3499) / (node_3499 - 1)*_EmissionColor_var.rgb*_EmissionPower_var)+(Diffuse*lerp(lerp(CustomLight,_ShadowColor_var.rgb,_ShadowTex_var.rgb),float3(node_1168,node_1168,node_1168),floor((LightDirection*LightAttenuation) * node_9951) / (node_9951 - 1))));
                float3 emissive = Emission;
                float4 _SpecularColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularColor );
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float _SpecularSize_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularSize );
                float node_9996 = posterizeSteps;
                float3 node_7200 = (_SpecularColor_var.rgb*floor((_SpecularPower_var*pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecularSize_var))) * node_9996) / (node_9996 - 1));
                float node_3226 = posterizeSteps;
                float node_3373 = posterizeSteps;
                float3 finalColor = emissive + ((node_7200+(floor(node_4056 * node_3226) / (node_3226 - 1)*node_7026))*(_LightColor0.rgb*floor(attenuation * node_3373) / (node_3373 - 1)*_LightColor_var.rgb));
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc" 
            #include "SimplexNoise3D.hlsl"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalTex; uniform float4 _NormalTex_ST;
            uniform sampler2D _EmissionTex; uniform float4 _EmissionTex_ST;
            uniform sampler2D _ShadowTex; uniform float4 _ShadowTex_ST;
            float3 displacement( float3 pos , float intensity , float tiling , float3 normal ){
                return snoise(pos*tiling) * intensity * normal;
            }
            
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularSize)
                UNITY_DEFINE_INSTANCED_PROP( float, _NormalPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _MainColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EmissionColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _SpecularPower)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _ShadowColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _Steps)
                UNITY_DEFINE_INSTANCED_PROP( float, _MainPannY)
                UNITY_DEFINE_INSTANCED_PROP( float, _MainPannX)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPannX)
                UNITY_DEFINE_INSTANCED_PROP( float, _EmissionPannY)
                UNITY_DEFINE_INSTANCED_PROP( float4, _SpecularColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _DisplacementIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _Noise3DTiling)
                UNITY_DEFINE_INSTANCED_PROP(float4, _LocalPosition)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float _DisplacementIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DisplacementIntensity );
                float _Noise3DTiling_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Noise3DTiling );
                float4 _LocalPosition_var = UNITY_ACCESS_INSTANCED_PROP(Props, _LocalPosition);
                v.vertex.xyz += displacement(v.vertex.rgb + _LocalPosition_var, _DisplacementIntensity_var, _Noise3DTiling_var, v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_3079 = _Time;
                float _MainPannX_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainPannX );
                float _MainPannY_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainPannY );
                float2 MainPann = (((i.uv0+(node_3079.g*_MainPannX_var)*float2(1,0))+(i.uv0+(node_3079.g*_MainPannY_var)*float2(0,1)))/2.0);
                float2 node_3761 = MainPann;
                float3 _NormalTex_var = UnpackNormal(tex2D(_NormalTex,TRANSFORM_TEX(node_3761, _NormalTex)));
                float _NormalPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _NormalPower );
                float3 Normal = lerp(float3(0,0,1),_NormalTex_var.rgb,_NormalPower_var);
                float3 normalLocal = Normal;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _SpecularColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularColor );
                float _SpecularPower_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularPower );
                float _SpecularSize_var = UNITY_ACCESS_INSTANCED_PROP( Props, _SpecularSize );
                float _Steps_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Steps );
                float posterizeSteps = _Steps_var;
                float node_9996 = posterizeSteps;
                float3 node_7200 = (_SpecularColor_var.rgb*floor((_SpecularPower_var*pow(max(0,dot(halfDirection,normalDirection)),exp2(_SpecularSize_var))) * node_9996) / (node_9996 - 1));
                float node_4056 = max(0,dot(normalDirection,lightDirection));
                float node_3226 = posterizeSteps;
                float2 node_2954 = MainPann;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2954, _MainTex));
                float4 _MainColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _MainColor );
                float3 node_7026 = (_MainTex_var.rgb*_MainColor_var.rgb);
                float node_3373 = posterizeSteps;
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float3 finalColor = ((node_7200+(floor(node_4056 * node_3226) / (node_3226 - 1)*node_7026))*(_LightColor0.rgb*floor(attenuation * node_3373) / (node_3373 - 1)*_LightColor_var.rgb));
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc" 
            #include "SimplexNoise3D.hlsl"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma target 3.0
            float3 displacement( float3 pos , float intensity , float tiling , float3 normal ){
            return snoise(pos*tiling) * intensity * normal;
            }
            
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _DisplacementIntensity)
                UNITY_DEFINE_INSTANCED_PROP( float, _Noise3DTiling)
                UNITY_DEFINE_INSTANCED_PROP(float4, _LocalPosition)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                float _DisplacementIntensity_var = UNITY_ACCESS_INSTANCED_PROP( Props, _DisplacementIntensity );
                float _Noise3DTiling_var = UNITY_ACCESS_INSTANCED_PROP( Props, _Noise3DTiling );
                float4 _LocalPosition_var = UNITY_ACCESS_INSTANCED_PROP(Props, _LocalPosition);
                v.vertex.xyz += displacement(v.vertex.rgb + _LocalPosition_var, _DisplacementIntensity_var, _Noise3DTiling_var, v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
