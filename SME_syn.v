/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Tue Jun 13 05:44:23 2023
/////////////////////////////////////////////////////////////


module SME_DW01_add_1 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [6:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2X1 U3 ( .A(B[5]), .B(carry[5]), .Y(SUM[5]) );
  XNOR2X1 U4 ( .A(B[6]), .B(n2), .Y(SUM[6]) );
  NAND2X1 U5 ( .A(B[5]), .B(carry[5]), .Y(n2) );
endmodule


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   star, N200, N201, N202, N203, N204, N208, N209, N210, N211, N212,
         N213, N214, N215, N216, N217, N218, N219, N220, N254, N282, N283,
         N284, N285, N286, N287, N288, N289, N290, N291, N423, N424, N425,
         N426, N427, N428, N429, N430, N431, N432, N433, N434, N435, N436,
         N437, N438, N439, N440, N441, N442, N443, N444, N445, N446, N447,
         N448, N449, N450, N451, N452, N453, N454, N455, N456, N457, N458,
         N459, N460, N540, N541, N542, N543, N544, N918, N919, N920, N921,
         N922, n1340, n1341, n1347, n1348, n1349, n1350, n1352, n1353, n1354,
         n1356, n1357, n1358, n1361, n1362, n1363, n1364, n1365, n1366, n1367,
         n1368, n1369, n1370, n1373, n1690, n1692, n1694, n1696, n1698, n1700,
         n1702, n1704, n1706, n1708, n1710, n1712, n1714, n1716, n1718, n1720,
         n1722, n1724, n1726, n1728, n1730, n1732, n1734, n1736, n1738, n1740,
         n1742, n1744, n1746, n1748, n1757, n1761, n2019, n2021, n2023, n2025,
         n2027, n2035, n2037, n2040, n2041, n2042, n2043, n2044, n2047, n2048,
         n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057, n2058,
         n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067, n2068,
         n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077, n2078,
         n2079, n2080, n2081, n2082, n2083, n2085, n2086, n2087, n2088, n2089,
         n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099,
         n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109,
         n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119,
         n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129,
         n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139,
         n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149,
         n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159,
         n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169,
         n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179,
         n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189,
         n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199,
         n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209,
         n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219,
         n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229,
         n2230, n2231, n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239,
         n2240, n2241, n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249,
         n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259,
         n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269,
         n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279,
         n2280, n2281, n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289,
         n2290, n2291, n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299,
         n2300, n2301, n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309,
         n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319,
         n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329,
         n2330, n2331, n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339,
         n2340, n2341, n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349,
         \gt_100/A[0] , n2350, n2351, n2352, n2353, n2354, n2355, n2356, n2357,
         n2358, n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367,
         n2368, n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377,
         n2378, n2379, n2380, n2381, n2382, n2383, n2384, n2385, n2386, n2387,
         n2388, n2389, n2390, n2391, n2392, n2393, n2394, n2395, n2433, n2434,
         n2435, n2436, n2437, n2438, n2439, n2440, n2441, n2442, n2443, n2444,
         n2445, n2446, n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454,
         n2455, n2456, n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464,
         n2465, n2466, n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474,
         n2475, n2476, n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484,
         n2485, n2486, n2487, n2488, n2489, n2490, n2491, n2492, n2493, n2494,
         n2495, n2496, n2497, n2498, n2499, n2500, n2501, n2502, n2503, n2504,
         n2505, n2506, n2507, n2508, n2509, n2510, n2511, n2512, n2513, n2514,
         n2515, n2516, n2517, n2518, n2519, n2520, n2521, n2522, n2523, n2524,
         n2525, n2526, n2527, n2528, n2529, n2530, n2531, n2532, n2533, n2534,
         n2535, n2536, n2537, n2538, n2539, n2540, n2541, n2542, n2543, n2544,
         n2545, n2546, n2547, n2548, n2549, n2550, n2551, n2552, n2553, n2554,
         n2555, n2556, n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564,
         n2565, n2566, n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574,
         n2575, n2576, n2577, n2578, n2579, n2580, n2581, n2582, n2583, n2584,
         n2585, n2586, n2587, n2588, n2589, n2590, n2591, n2592, n2593, n2594,
         n2595, n2596, n2597, n2598, n2599, n2600, n2601, n2602, n2603, n2604,
         n2605, n2606, n2607, n2608, n2609, n2610, n2611, n2612, n2613, n2614,
         n2615, n2616, n2617, n2618, n2619, n2620, n2621, n2622, n2623, n2624,
         n2625, n2626, n2627, n2628, n2629, n2630, n2631, n2632, n2633, n2634,
         n2635, n2636, n2637, n2638, n2639, n2640, n2641, n2642, n2643, n2644,
         n2645, n2646, n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654,
         n2655, n2656, n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2664,
         n2665, n2666, n2667, n2668, n2669, n2670, n2671, n2672, n2673, n2674,
         n2675, n2676, n2677, n2678, n2679, n2680, n2681, n2682, n2683, n2684,
         n2685, n2686, n2687, n2688, n2689, n2690, n2691, n2692, n2693, n2694,
         n2695, n2696, n2697, n2698, n2699, n2700, n2701, n2702, n2703, n2704,
         n2705, n2706, n2707, n2708, n2709, n2710, n2711, n2712, n2713, n2714,
         n2715, n2716, n2717, n2718, n2719, n2720, n2721, n2722, n2723, n2724,
         n2725, n2726, n2727, n2728, n2729, n2730, n2731, n2732, n2733, n2734,
         n2735, n2736, n2737, n2738, n2739, n2740, n2741, n2742, n2743, n2744,
         n2745, n2746, n2747, n2748, n2749, n2750, n2751, n2752, n2753, n2754,
         n2755, n2756, n2757, n2758, n2759, n2760, n2761, n2762, n2763, n2764,
         n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772, n2773, n2774,
         n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782, n2783, n2784,
         n2785, n2786, n2787, n2788, n2789, n2790, n2791, n2792, n2793, n2794,
         n2795, n2796, n2797, n2798, n2799, n2800, n2801, n2802, n2803, n2804,
         n2805, n2806, n2807, n2808, n2809, n2810, n2811, n2812, n2813, n2814,
         n2815, n2816, n2817, n2818, n2819, n2820, n2821, n2822, n2823, n2824,
         n2825, n2826, n2827, n2828, n2829, n2830, n2831, n2832, n2833, n2834,
         n2835, n2836, n2837, n2838, n2839, n2840, n2841, n2842, n2843, n2844,
         n2845, n2846, n2847, n2848, n2849, n2850, n2851, n2852, n2853, n2854,
         n2855, n2856, n2857, n2858, n2859, n2860, n2861, n2862, n2863, n2864,
         n2865, n2866, n2867, n2868, n2869, n2870, n2871, n2872, n2873, n2874,
         n2875, n2876, n2877, n2878, n2879, n2880, n2881, n2882, n2883, n2884,
         n2885, n2886, n2887, n2888, n2889, n2890, n2891, n2892, n2893, n2894,
         n2895, n2896, n2897, n2898, n2899, n2900, n2901, n2902, n2903, n2904,
         n2905, n2906, n2907, n2908, n2909, n2910, n2911, n2912, n2913, n2914,
         n2915, n2916, n2917, n2918, n2919, n2920, n2921, n2922, n2923, n2924,
         n2925, n2926, n2927, n2928, n2929, n2930, n2931, n2932, n2933, n2934,
         n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942, n2943, n2944,
         n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952, n2953, n2954,
         n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962, n2963, n2964,
         n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972, n2973, n2974,
         n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982, n2983, n2984,
         n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992, n2993, n2994,
         n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002, n3003, n3004,
         n3005, n3006, n3007, n3008, n3009, n3010, n3011, n3012, n3013, n3014,
         n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022, n3023, n3024,
         n3025, n3026, n3027, n3028, n3029, n3030, n3031, n3032, n3033, n3034,
         n3035, n3036, n3037, n3038, n3039, n3040, n3041, n3042, n3043, n3044,
         n3045, n3046, n3047, n3048, n3049, n3050, n3051, n3052, n3053, n3054,
         n3055, n3056, n3057, n3058, n3059, n3060, n3061, n3062, n3063, n3064,
         n3065, n3066, n3067, n3068, n3069, n3070, n3071, n3072, n3073, n3074,
         n3075, n3076, n3077, n3078, n3079, n3080, n3081, n3082, n3083, n3084,
         n3085, n3086, n3087, n3088, n3089, n3090, n3091, n3092, n3093, n3094,
         n3095, n3096, n3097, n3098, n3099, n3100, n3101, n3102, n3103, n3104,
         n3105, n3106, n3107, n3108, n3109, n3110, n3111, n3112, n3113, n3114,
         n3115, n3116, n3117, n3118, n3119, n3120, n3121, n3122, n3123, n3124,
         n3125, n3126, n3127, n3128, n3129, n3130, n3131, n3132, n3133, n3134,
         n3135, n3136, n3137, n3138, n3139, n3140, n3141, n3142, n3143, n3144,
         n3145, n3146, n3147, n3148, n3149, n3150, n3151, n3152, n3153, n3154,
         n3155, n3156, n3157, n3158, n3159, n3160, n3161, n3162, n3163, n3164,
         n3165, n3166, n3167, n3168, n3169, n3170, n3171, n3172, n3173, n3174,
         n3175, n3176, n3177, n3178, n3179, n3180, n3181, n3182, n3183, n3184,
         n3185, n3186, n3187, n3188, n3189, n3190, n3191, n3192, n3193, n3194,
         n3195, n3196, n3197, n3198, n3199, n3200, n3201, n3202, n3203, n3204,
         n3205, n3206, n3207, n3208, n3209, n3210, n3211, n3212, n3213, n3214,
         n3215, n3216, n3217, n3218, n3219, n3220, n3221, n3222, n3223, n3224,
         n3225, n3226, n3227, n3228, n3229, n3230, n3231, n3232, n3233, n3234,
         n3235, n3236, n3237, n3238, n3239, n3240, n3241, n3242, n3243, n3244,
         n3245, n3246, n3247, n3248, n3249, n3250, n3251, n3252, n3253, n3254,
         n3255, n3256, n3257, n3258, n3259, n3260, n3261, n3262, n3263, n3264,
         n3265, n3266, n3267, n3268, n3269, n3270, n3271, n3272, n3273, n3274,
         n3275, n3276, n3277, n3278, n3279, n3280, n3281, n3282, n3283, n3284,
         n3285, n3286, n3287, n3288, n3289, n3290, n3291, n3292, n3293, n3294,
         n3295, n3296, n3297, n3298, n3299, n3300, n3301, n3302, n3303, n3304,
         n3305, n3306, n3307, n3308, n3309, n3310, n3311, n3312, n3313, n3314,
         n3315, n3316, n3317, n3318, n3319, n3320, n3321, n3322, n3323, n3324,
         n3325, n3326, n3327, n3328, n3329, n3330, n3331, n3332, n3333, n3334,
         n3335, n3336, n3337, n3338, n3339, n3340, n3341, n3342, n3343, n3344,
         n3345, n3346, n3347, n3348, n3349, n3350, n3351, n3352, n3353, n3354,
         n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3362, n3363, n3364,
         n3365, n3366, n3367, n3368, n3369, n3370, n3371, n3372, n3373, n3374,
         n3375, n3376, n3377, n3378, n3379, n3380, n3381, n3382, n3383, n3384,
         n3385, n3386, n3387, n3388, n3389, n3390, n3391, n3392, n3393, n3394,
         n3395, n3396, n3397, n3398, n3399, n3400, n3401, n3402, n3403, n3404,
         n3405, n3406, n3407, n3408, n3409, n3410, n3411, n3412, n3413, n3414,
         n3415, n3416, n3417, n3418, n3419, n3420, n3421, n3422, n3423, n3424,
         n3425, n3426, n3427, n3428, n3429, n3430, n3431, n3432, n3433, n3434,
         n3435, n3436, n3437, n3438, n3439, n3440, n3441, n3442, n3443, n3444,
         n3445, n3446, n3447, n3448, n3449, n3450, n3451, n3452, n3453, n3454,
         n3455, n3456, n3457, n3458, n3459, n3460, n3461, n3462, n3463, n3464,
         n3465, n3466, n3467, n3468, n3469, n3470, n3471, n3472, n3473, n3474,
         n3475, n3476, n3477, n3478, n3479, n3480, n3481, n3482, n3483, n3484,
         n3485, n3486, n3487, n3488, n3489, n3490, n3491, n3492, n3493, n3494,
         n3495, n3496, n3497, n3498, n3499, n3500, n3501, n3502, n3503, n3504,
         n3505, n3506, n3507, n3508, n3509, n3510, n3511, n3512, n3513, n3514,
         n3515, n3516, n3517, n3518, n3519, n3520, n3521, n3522, n3523, n3524,
         n3525, n3526, n3527, n3528, n3529, n3530, n3531, n3532, n3533, n3534,
         n3535, n3536, n3537, n3538, n3539, n3540, n3541, n3542, n3543, n3544,
         n3545, n3546, n3547, n3548, n3549, n3550, n3551, n3552, n3553, n3554,
         n3555, n3556, n3557, n3558, n3559, n3560, n3561, n3562, n3563, n3564,
         n3565, n3566, n3567, n3568, n3569, n3570, n3571, n3572, n3573, n3574,
         n3575, n3576, n3577, n3578, n3579, n3580, n3581, n3582, n3583, n3584,
         n3585, n3586, n3587, n3588, n3589, n3590, n3591, n3592, n3593, n3594,
         n3595, n3596, n3597, n3598, n3599, n3600, n3601, n3602, n3603, n3604,
         n3605, n3606, n3607, n3608, n3609, n3610, n3611, n3612, n3613, n3614,
         n3615, n3616, n3617, n3618, n3619, n3620, n3621, n3622, n3623, n3624,
         n3625, n3626, n3627, n3628, n3629, n3630, n3631, n3632, n3633, n3634,
         n3635, n3636, n3637, n3638, n3639, n3640, n3641, n3642, n3643, n3644,
         n3645, n3646, n3647, n3648, n3649, n3650, n3651, n3652, n3653, n3654,
         n3655, n3656, n3657, n3658, n3659, n3660, n3661, n3662, n3663, n3664,
         n3665, n3666, n3667, n3668, n3669, n3670, n3671, n3672, n3673, n3674,
         n3675, n3676, n3677, n3678, n3679, n3680, n3681, n3682, n3683, n3684,
         n3685, n3686, n3687, n3688, n3689, n3690, n3691, n3692, n3693, n3694,
         n3695, n3696, n3697, n3698, n3699, n3700, n3701, n3702, n3703, n3704,
         n3705, n3706, n3707, n3708, n3709, n3710, n3711, n3712, n3713, n3714,
         n3715, n3716, n3717, n3718, n3719, n3720, n3721, n3722, n3723, n3724,
         n3725, n3726, n3727, n3728, n3729, n3730, n3731, n3732, n3733, n3734,
         n3735, n3736, n3737, n3738, n3739, n3740, n3741, n3742, n3743, n3744,
         n3745, n3746, n3747, n3748, n3749, n3750, n3751, n3752, n3753, n3754,
         n3755, n3756, n3757, n3758, n3759, n3760, n3761, n3762, n3763, n3764,
         n3765, n3766, n3767, n3768, n3769, n3770, n3771, n3772, n3773, n3774,
         n3775, n3776, n3777, n3778, n3779, n3780, n3781, n3782, n3783, n3784,
         n3785, n3786, n3787, n3788, n3789, n3790, n3791, n3792;
  wire   [4:0] match_index_ns;
  wire   [4:0] string_length;
  wire   [3:0] count_pat;
  wire   [4:0] star_index;
  wire   [4:0] str_index;
  wire   [4:2] \add_315/carry ;
  wire   [4:1] \r761/carry ;

  SME_DW01_add_1 r759 ( .A({1'b0, 1'b0, match_index_ns[4:1], \gt_100/A[0] }), 
        .B({N212, N212, N212, N211, N210, n2452, N208}), .CI(1'b0), .SUM({N219, 
        N218, N217, N216, N215, N214, N213}) );
  DFFNSRX1 \star_match_index_reg[4]  ( .D(n2090), .CKN(clk), .SN(1'b1), .RN(
        n2527), .QN(n3526) );
  DFFNSRX1 \star_match_index_reg[3]  ( .D(n2089), .CKN(clk), .SN(1'b1), .RN(
        n2527), .QN(n3525) );
  DFFNSRX1 \star_match_index_reg[2]  ( .D(n2088), .CKN(clk), .SN(1'b1), .RN(
        n2527), .QN(n3524) );
  DFFNSRX1 \star_match_index_reg[1]  ( .D(n2087), .CKN(clk), .SN(1'b1), .RN(
        n2527), .QN(n3523) );
  DFFNSRX1 \star_match_index_reg[0]  ( .D(n2086), .CKN(clk), .SN(1'b1), .RN(
        n2527), .QN(n3522) );
  DFFNSRX1 star_h_reg ( .D(n2085), .CKN(clk), .SN(1'b1), .RN(n2530), .QN(n3527) );
  DFFNSRX1 money_reg ( .D(n2349), .CKN(clk), .SN(1'b1), .RN(n2556), .Q(n2451), 
        .QN(n3778) );
  DFFNSRX1 \str_mem_reg[31][0]  ( .D(n2341), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3679) );
  DFFNSRX1 \str_mem_reg[31][7]  ( .D(n2348), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3777) );
  DFFNSRX1 \str_mem_reg[31][4]  ( .D(n2345), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3559) );
  DFFNSRX1 \str_mem_reg[30][6]  ( .D(n2339), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3773) );
  DFFNSRX1 \str_mem_reg[29][6]  ( .D(n2331), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3770) );
  DFFNSRX1 \str_mem_reg[28][6]  ( .D(n2323), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3767) );
  DFFNSRX1 \str_mem_reg[27][6]  ( .D(n2315), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3764) );
  DFFNSRX1 \str_mem_reg[26][6]  ( .D(n2307), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3761) );
  DFFNSRX1 \str_mem_reg[25][6]  ( .D(n2299), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3758) );
  DFFNSRX1 \str_mem_reg[24][6]  ( .D(n2291), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3755) );
  DFFNSRX1 \str_mem_reg[23][7]  ( .D(n2284), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3753) );
  DFFNSRX1 \str_mem_reg[15][7]  ( .D(n2220), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3729) );
  DFFNSRX1 \str_mem_reg[7][7]  ( .D(n2156), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3705) );
  DFFNSRX1 \str_mem_reg[30][1]  ( .D(n2334), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3563) );
  DFFNSRX1 \str_mem_reg[29][1]  ( .D(n2326), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3567) );
  DFFNSRX1 \str_mem_reg[28][1]  ( .D(n2318), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3571) );
  DFFNSRX1 \str_mem_reg[27][1]  ( .D(n2310), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3575) );
  DFFNSRX1 \str_mem_reg[26][1]  ( .D(n2302), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3579) );
  DFFNSRX1 \str_mem_reg[25][1]  ( .D(n2294), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3583) );
  DFFNSRX1 \str_mem_reg[24][1]  ( .D(n2286), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3587) );
  DFFNSRX1 \str_mem_reg[30][5]  ( .D(n2338), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3772) );
  DFFNSRX1 \str_mem_reg[29][5]  ( .D(n2330), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3769) );
  DFFNSRX1 \str_mem_reg[28][5]  ( .D(n2322), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3766) );
  DFFNSRX1 \str_mem_reg[27][5]  ( .D(n2314), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3763) );
  DFFNSRX1 \str_mem_reg[26][5]  ( .D(n2306), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3760) );
  DFFNSRX1 \str_mem_reg[25][5]  ( .D(n2298), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3757) );
  DFFNSRX1 \str_mem_reg[24][5]  ( .D(n2290), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3754) );
  DFFNSRX1 \str_mem_reg[31][5]  ( .D(n2346), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3775) );
  DFFNSRX1 \str_mem_reg[23][2]  ( .D(n2279), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3590) );
  DFFNSRX1 \str_mem_reg[15][2]  ( .D(n2215), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3622) );
  DFFNSRX1 \str_mem_reg[7][2]  ( .D(n2151), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3654) );
  DFFNSRX1 \str_mem_reg[30][7]  ( .D(n2340), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3774) );
  DFFNSRX1 \str_mem_reg[29][7]  ( .D(n2332), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3771) );
  DFFNSRX1 \str_mem_reg[28][7]  ( .D(n2324), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3768) );
  DFFNSRX1 \str_mem_reg[27][7]  ( .D(n2316), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3765) );
  DFFNSRX1 \str_mem_reg[26][7]  ( .D(n2308), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3762) );
  DFFNSRX1 \str_mem_reg[25][7]  ( .D(n2300), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3759) );
  DFFNSRX1 \str_mem_reg[24][7]  ( .D(n2292), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3756) );
  DFFNSRX1 \str_mem_reg[23][0]  ( .D(n2277), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3589) );
  DFFNSRX1 \str_mem_reg[15][0]  ( .D(n2213), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3621) );
  DFFNSRX1 \str_mem_reg[7][0]  ( .D(n2149), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3653) );
  DFFNSRX1 \str_mem_reg[31][6]  ( .D(n2347), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3776) );
  DFFNSRX1 \str_mem_reg[31][1]  ( .D(n2342), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3681) );
  DFFNSRX1 \str_mem_reg[30][4]  ( .D(n2337), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3558) );
  DFFNSRX1 \str_mem_reg[29][4]  ( .D(n2329), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3557) );
  DFFNSRX1 \str_mem_reg[28][4]  ( .D(n2321), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3556) );
  DFFNSRX1 \str_mem_reg[27][4]  ( .D(n2313), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3555) );
  DFFNSRX1 \str_mem_reg[26][4]  ( .D(n2305), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3554) );
  DFFNSRX1 \str_mem_reg[25][4]  ( .D(n2297), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3553) );
  DFFNSRX1 \str_mem_reg[24][4]  ( .D(n2289), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3552) );
  DFFNSRX1 \str_mem_reg[31][2]  ( .D(n2343), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3680) );
  DFFNSRX1 \str_mem_reg[30][2]  ( .D(n2335), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3562) );
  DFFNSRX1 \str_mem_reg[29][2]  ( .D(n2327), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3566) );
  DFFNSRX1 \str_mem_reg[28][2]  ( .D(n2319), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3570) );
  DFFNSRX1 \str_mem_reg[27][2]  ( .D(n2311), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3574) );
  DFFNSRX1 \str_mem_reg[26][2]  ( .D(n2303), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3578) );
  DFFNSRX1 \str_mem_reg[25][2]  ( .D(n2295), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3582) );
  DFFNSRX1 \str_mem_reg[24][2]  ( .D(n2287), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3586) );
  DFFNSRX1 \str_mem_reg[31][3]  ( .D(n2344), .CKN(clk), .SN(1'b1), .RN(n2555), 
        .QN(n3678) );
  DFFNSRX1 \str_mem_reg[30][0]  ( .D(n2333), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3561) );
  DFFNSRX1 \str_mem_reg[29][0]  ( .D(n2325), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3565) );
  DFFNSRX1 \str_mem_reg[28][0]  ( .D(n2317), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3569) );
  DFFNSRX1 \str_mem_reg[27][0]  ( .D(n2309), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3573) );
  DFFNSRX1 \str_mem_reg[26][0]  ( .D(n2301), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3577) );
  DFFNSRX1 \str_mem_reg[25][0]  ( .D(n2293), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3581) );
  DFFNSRX1 \str_mem_reg[24][0]  ( .D(n2285), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3585) );
  DFFNSRX1 \str_mem_reg[23][3]  ( .D(n2280), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3588) );
  DFFNSRX1 \str_mem_reg[30][3]  ( .D(n2336), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3560) );
  DFFNSRX1 \str_mem_reg[29][3]  ( .D(n2328), .CKN(clk), .SN(1'b1), .RN(n2554), 
        .QN(n3564) );
  DFFNSRX1 \str_mem_reg[28][3]  ( .D(n2320), .CKN(clk), .SN(1'b1), .RN(n2553), 
        .QN(n3568) );
  DFFNSRX1 \str_mem_reg[27][3]  ( .D(n2312), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3572) );
  DFFNSRX1 \str_mem_reg[26][3]  ( .D(n2304), .CKN(clk), .SN(1'b1), .RN(n2552), 
        .QN(n3576) );
  DFFNSRX1 \str_mem_reg[25][3]  ( .D(n2296), .CKN(clk), .SN(1'b1), .RN(n2551), 
        .QN(n3580) );
  DFFNSRX1 \str_mem_reg[24][3]  ( .D(n2288), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3584) );
  DFFNSRX1 \string_length_reg[0]  ( .D(n2019), .CKN(clk), .SN(1'b1), .RN(1'b1), 
        .Q(string_length[0]) );
  DFFNSRX1 \string_length_reg[3]  ( .D(n2025), .CKN(clk), .SN(1'b1), .RN(1'b1), 
        .Q(string_length[3]), .QN(n2369) );
  DFFNSRX1 \str_mem_reg[23][4]  ( .D(n2281), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3551) );
  DFFNSRX1 \str_mem_reg[15][4]  ( .D(n2217), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3543) );
  DFFNSRX1 \str_mem_reg[7][4]  ( .D(n2153), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3535) );
  DFFNSRX1 \str_mem_reg[22][6]  ( .D(n2275), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3749) );
  DFFNSRX1 \str_mem_reg[21][6]  ( .D(n2267), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3746) );
  DFFNSRX1 \str_mem_reg[20][6]  ( .D(n2259), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3743) );
  DFFNSRX1 \str_mem_reg[19][6]  ( .D(n2251), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3740) );
  DFFNSRX1 \str_mem_reg[18][6]  ( .D(n2243), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3737) );
  DFFNSRX1 \str_mem_reg[17][6]  ( .D(n2235), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3734) );
  DFFNSRX1 \str_mem_reg[16][6]  ( .D(n2227), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3731) );
  DFFNSRX1 \str_mem_reg[14][6]  ( .D(n2211), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3725) );
  DFFNSRX1 \str_mem_reg[13][6]  ( .D(n2203), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3722) );
  DFFNSRX1 \str_mem_reg[12][6]  ( .D(n2195), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3719) );
  DFFNSRX1 \str_mem_reg[11][6]  ( .D(n2187), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3716) );
  DFFNSRX1 \str_mem_reg[10][6]  ( .D(n2179), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3713) );
  DFFNSRX1 \str_mem_reg[9][6]  ( .D(n2171), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3710) );
  DFFNSRX1 \str_mem_reg[8][6]  ( .D(n2163), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3707) );
  DFFNSRX1 \str_mem_reg[6][6]  ( .D(n2147), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3701) );
  DFFNSRX1 \str_mem_reg[5][6]  ( .D(n2139), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3698) );
  DFFNSRX1 \str_mem_reg[4][6]  ( .D(n2131), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3695) );
  DFFNSRX1 \str_mem_reg[3][6]  ( .D(n2123), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3692) );
  DFFNSRX1 \str_mem_reg[2][6]  ( .D(n2115), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3689) );
  DFFNSRX1 \str_mem_reg[1][7]  ( .D(n2108), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3687) );
  DFFNSRX1 \str_mem_reg[22][1]  ( .D(n2270), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3595) );
  DFFNSRX1 \str_mem_reg[21][1]  ( .D(n2262), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3599) );
  DFFNSRX1 \str_mem_reg[20][1]  ( .D(n2254), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3603) );
  DFFNSRX1 \str_mem_reg[19][1]  ( .D(n2246), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3607) );
  DFFNSRX1 \str_mem_reg[18][1]  ( .D(n2238), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3611) );
  DFFNSRX1 \str_mem_reg[17][1]  ( .D(n2230), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3615) );
  DFFNSRX1 \str_mem_reg[16][1]  ( .D(n2222), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3619) );
  DFFNSRX1 \str_mem_reg[14][1]  ( .D(n2206), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3627) );
  DFFNSRX1 \str_mem_reg[13][1]  ( .D(n2198), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3631) );
  DFFNSRX1 \str_mem_reg[12][1]  ( .D(n2190), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3635) );
  DFFNSRX1 \str_mem_reg[11][1]  ( .D(n2182), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3639) );
  DFFNSRX1 \str_mem_reg[10][1]  ( .D(n2174), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3643) );
  DFFNSRX1 \str_mem_reg[9][1]  ( .D(n2166), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3647) );
  DFFNSRX1 \str_mem_reg[8][1]  ( .D(n2158), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3651) );
  DFFNSRX1 \str_mem_reg[6][1]  ( .D(n2142), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3659) );
  DFFNSRX1 \str_mem_reg[5][1]  ( .D(n2134), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3663) );
  DFFNSRX1 \str_mem_reg[4][1]  ( .D(n2126), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3667) );
  DFFNSRX1 \str_mem_reg[3][1]  ( .D(n2118), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3671) );
  DFFNSRX1 \str_mem_reg[2][1]  ( .D(n2110), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3675) );
  DFFNSRX1 \str_mem_reg[22][5]  ( .D(n2274), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3748) );
  DFFNSRX1 \str_mem_reg[21][5]  ( .D(n2266), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3745) );
  DFFNSRX1 \str_mem_reg[20][5]  ( .D(n2258), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3742) );
  DFFNSRX1 \str_mem_reg[19][5]  ( .D(n2250), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3739) );
  DFFNSRX1 \str_mem_reg[18][5]  ( .D(n2242), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3736) );
  DFFNSRX1 \str_mem_reg[17][5]  ( .D(n2234), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3733) );
  DFFNSRX1 \str_mem_reg[16][5]  ( .D(n2226), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3730) );
  DFFNSRX1 \str_mem_reg[14][5]  ( .D(n2210), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3724) );
  DFFNSRX1 \str_mem_reg[13][5]  ( .D(n2202), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3721) );
  DFFNSRX1 \str_mem_reg[12][5]  ( .D(n2194), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3718) );
  DFFNSRX1 \str_mem_reg[11][5]  ( .D(n2186), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3715) );
  DFFNSRX1 \str_mem_reg[10][5]  ( .D(n2178), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3712) );
  DFFNSRX1 \str_mem_reg[9][5]  ( .D(n2170), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3709) );
  DFFNSRX1 \str_mem_reg[8][5]  ( .D(n2162), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3706) );
  DFFNSRX1 \str_mem_reg[6][5]  ( .D(n2146), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3700) );
  DFFNSRX1 \str_mem_reg[5][5]  ( .D(n2138), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3697) );
  DFFNSRX1 \str_mem_reg[4][5]  ( .D(n2130), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3694) );
  DFFNSRX1 \str_mem_reg[3][5]  ( .D(n2122), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3691) );
  DFFNSRX1 \str_mem_reg[2][5]  ( .D(n2114), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3688) );
  DFFNSRX1 \str_mem_reg[0][7]  ( .D(n2100), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3685) );
  DFFNSRX1 \str_mem_reg[23][6]  ( .D(n2283), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3752) );
  DFFNSRX1 \str_mem_reg[15][6]  ( .D(n2219), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3728) );
  DFFNSRX1 \str_mem_reg[7][6]  ( .D(n2155), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3704) );
  DFFNSRX1 \str_mem_reg[22][7]  ( .D(n2276), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3750) );
  DFFNSRX1 \str_mem_reg[21][7]  ( .D(n2268), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3747) );
  DFFNSRX1 \str_mem_reg[20][7]  ( .D(n2260), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3744) );
  DFFNSRX1 \str_mem_reg[19][7]  ( .D(n2252), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3741) );
  DFFNSRX1 \str_mem_reg[18][7]  ( .D(n2244), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3738) );
  DFFNSRX1 \str_mem_reg[17][7]  ( .D(n2236), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3735) );
  DFFNSRX1 \str_mem_reg[16][7]  ( .D(n2228), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3732) );
  DFFNSRX1 \str_mem_reg[14][7]  ( .D(n2212), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3726) );
  DFFNSRX1 \str_mem_reg[13][7]  ( .D(n2204), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3723) );
  DFFNSRX1 \str_mem_reg[12][7]  ( .D(n2196), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3720) );
  DFFNSRX1 \str_mem_reg[11][7]  ( .D(n2188), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3717) );
  DFFNSRX1 \str_mem_reg[10][7]  ( .D(n2180), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3714) );
  DFFNSRX1 \str_mem_reg[9][7]  ( .D(n2172), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3711) );
  DFFNSRX1 \str_mem_reg[8][7]  ( .D(n2164), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3708) );
  DFFNSRX1 \str_mem_reg[6][7]  ( .D(n2148), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3702) );
  DFFNSRX1 \str_mem_reg[5][7]  ( .D(n2140), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3699) );
  DFFNSRX1 \str_mem_reg[4][7]  ( .D(n2132), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3696) );
  DFFNSRX1 \str_mem_reg[3][7]  ( .D(n2124), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3693) );
  DFFNSRX1 \str_mem_reg[2][7]  ( .D(n2116), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3690) );
  DFFNSRX1 \str_mem_reg[23][1]  ( .D(n2278), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3591) );
  DFFNSRX1 \str_mem_reg[15][1]  ( .D(n2214), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3623) );
  DFFNSRX1 \str_mem_reg[7][1]  ( .D(n2150), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3655) );
  DFFNSRX1 \str_mem_reg[1][6]  ( .D(n2107), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3686) );
  DFFNSRX1 \str_mem_reg[1][0]  ( .D(n2101), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3676) );
  DFFNSRX1 \str_mem_reg[1][4]  ( .D(n2105), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3677) );
  DFFNSRX1 \str_mem_reg[22][4]  ( .D(n2273), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3550) );
  DFFNSRX1 \str_mem_reg[21][4]  ( .D(n2265), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3549) );
  DFFNSRX1 \str_mem_reg[20][4]  ( .D(n2257), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3548) );
  DFFNSRX1 \str_mem_reg[19][4]  ( .D(n2249), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3547) );
  DFFNSRX1 \str_mem_reg[18][4]  ( .D(n2241), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3546) );
  DFFNSRX1 \str_mem_reg[17][4]  ( .D(n2233), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3545) );
  DFFNSRX1 \str_mem_reg[16][4]  ( .D(n2225), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3544) );
  DFFNSRX1 \str_mem_reg[14][4]  ( .D(n2209), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3542) );
  DFFNSRX1 \str_mem_reg[13][4]  ( .D(n2201), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3541) );
  DFFNSRX1 \str_mem_reg[12][4]  ( .D(n2193), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3540) );
  DFFNSRX1 \str_mem_reg[11][4]  ( .D(n2185), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3539) );
  DFFNSRX1 \str_mem_reg[10][4]  ( .D(n2177), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3538) );
  DFFNSRX1 \str_mem_reg[9][4]  ( .D(n2169), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3537) );
  DFFNSRX1 \str_mem_reg[8][4]  ( .D(n2161), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3536) );
  DFFNSRX1 \str_mem_reg[6][4]  ( .D(n2145), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3534) );
  DFFNSRX1 \str_mem_reg[5][4]  ( .D(n2137), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3533) );
  DFFNSRX1 \str_mem_reg[4][4]  ( .D(n2129), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3532) );
  DFFNSRX1 \str_mem_reg[3][4]  ( .D(n2121), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3531) );
  DFFNSRX1 \str_mem_reg[2][4]  ( .D(n2113), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3530) );
  DFFNSRX1 \str_mem_reg[1][1]  ( .D(n2102), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3529) );
  DFFNSRX1 \str_mem_reg[0][6]  ( .D(n2099), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n3684) );
  DFFNSRX1 \str_mem_reg[0][0]  ( .D(n2093), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n3682) );
  DFFNSRX1 \str_mem_reg[0][4]  ( .D(n2097), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n3683) );
  DFFNSRX1 \str_mem_reg[0][1]  ( .D(n2094), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n3528) );
  DFFNSRX1 \str_mem_reg[23][5]  ( .D(n2282), .CKN(clk), .SN(1'b1), .RN(n2550), 
        .QN(n3751) );
  DFFNSRX1 \str_mem_reg[15][5]  ( .D(n2218), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3727) );
  DFFNSRX1 \str_mem_reg[7][5]  ( .D(n2154), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3703) );
  DFFNSRX1 \str_mem_reg[22][2]  ( .D(n2271), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3594) );
  DFFNSRX1 \str_mem_reg[21][2]  ( .D(n2263), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3598) );
  DFFNSRX1 \str_mem_reg[20][2]  ( .D(n2255), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3602) );
  DFFNSRX1 \str_mem_reg[19][2]  ( .D(n2247), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3606) );
  DFFNSRX1 \str_mem_reg[18][2]  ( .D(n2239), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3610) );
  DFFNSRX1 \str_mem_reg[17][2]  ( .D(n2231), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3614) );
  DFFNSRX1 \str_mem_reg[16][2]  ( .D(n2223), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3618) );
  DFFNSRX1 \str_mem_reg[14][2]  ( .D(n2207), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3626) );
  DFFNSRX1 \str_mem_reg[13][2]  ( .D(n2199), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3630) );
  DFFNSRX1 \str_mem_reg[12][2]  ( .D(n2191), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3634) );
  DFFNSRX1 \str_mem_reg[11][2]  ( .D(n2183), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3638) );
  DFFNSRX1 \str_mem_reg[10][2]  ( .D(n2175), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3642) );
  DFFNSRX1 \str_mem_reg[9][2]  ( .D(n2167), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3646) );
  DFFNSRX1 \str_mem_reg[8][2]  ( .D(n2159), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3650) );
  DFFNSRX1 \str_mem_reg[6][2]  ( .D(n2143), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3658) );
  DFFNSRX1 \str_mem_reg[5][2]  ( .D(n2135), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3662) );
  DFFNSRX1 \str_mem_reg[4][2]  ( .D(n2127), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3666) );
  DFFNSRX1 \str_mem_reg[3][2]  ( .D(n2119), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3670) );
  DFFNSRX1 \str_mem_reg[2][2]  ( .D(n2111), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3674) );
  DFFNSRX1 \string_length_reg[2]  ( .D(n2023), .CKN(clk), .SN(1'b1), .RN(1'b1), 
        .Q(string_length[2]), .QN(n2388) );
  DFFNSRX1 \str_mem_reg[22][0]  ( .D(n2269), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3593) );
  DFFNSRX1 \str_mem_reg[21][0]  ( .D(n2261), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3597) );
  DFFNSRX1 \str_mem_reg[20][0]  ( .D(n2253), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3601) );
  DFFNSRX1 \str_mem_reg[19][0]  ( .D(n2245), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3605) );
  DFFNSRX1 \str_mem_reg[18][0]  ( .D(n2237), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3609) );
  DFFNSRX1 \str_mem_reg[17][0]  ( .D(n2229), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3613) );
  DFFNSRX1 \str_mem_reg[16][0]  ( .D(n2221), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3617) );
  DFFNSRX1 \str_mem_reg[14][0]  ( .D(n2205), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3625) );
  DFFNSRX1 \str_mem_reg[13][0]  ( .D(n2197), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3629) );
  DFFNSRX1 \str_mem_reg[12][0]  ( .D(n2189), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3633) );
  DFFNSRX1 \str_mem_reg[11][0]  ( .D(n2181), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3637) );
  DFFNSRX1 \str_mem_reg[10][0]  ( .D(n2173), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3641) );
  DFFNSRX1 \str_mem_reg[9][0]  ( .D(n2165), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3645) );
  DFFNSRX1 \str_mem_reg[8][0]  ( .D(n2157), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3649) );
  DFFNSRX1 \str_mem_reg[6][0]  ( .D(n2141), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3657) );
  DFFNSRX1 \str_mem_reg[5][0]  ( .D(n2133), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3661) );
  DFFNSRX1 \str_mem_reg[4][0]  ( .D(n2125), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3665) );
  DFFNSRX1 \str_mem_reg[3][0]  ( .D(n2117), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3669) );
  DFFNSRX1 \str_mem_reg[2][0]  ( .D(n2109), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n3673) );
  DFFNSRX1 \str_mem_reg[15][3]  ( .D(n2216), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3620) );
  DFFNSRX1 \str_mem_reg[7][3]  ( .D(n2152), .CKN(clk), .SN(1'b1), .RN(n2539), 
        .QN(n3652) );
  DFFNSRX1 \str_mem_reg[22][3]  ( .D(n2272), .CKN(clk), .SN(1'b1), .RN(n2549), 
        .QN(n3592) );
  DFFNSRX1 \str_mem_reg[21][3]  ( .D(n2264), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3596) );
  DFFNSRX1 \str_mem_reg[20][3]  ( .D(n2256), .CKN(clk), .SN(1'b1), .RN(n2548), 
        .QN(n3600) );
  DFFNSRX1 \str_mem_reg[19][3]  ( .D(n2248), .CKN(clk), .SN(1'b1), .RN(n2547), 
        .QN(n3604) );
  DFFNSRX1 \str_mem_reg[18][3]  ( .D(n2240), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3608) );
  DFFNSRX1 \str_mem_reg[17][3]  ( .D(n2232), .CKN(clk), .SN(1'b1), .RN(n2546), 
        .QN(n3612) );
  DFFNSRX1 \str_mem_reg[16][3]  ( .D(n2224), .CKN(clk), .SN(1'b1), .RN(n2545), 
        .QN(n3616) );
  DFFNSRX1 \str_mem_reg[14][3]  ( .D(n2208), .CKN(clk), .SN(1'b1), .RN(n2544), 
        .QN(n3624) );
  DFFNSRX1 \str_mem_reg[13][3]  ( .D(n2200), .CKN(clk), .SN(1'b1), .RN(n2543), 
        .QN(n3628) );
  DFFNSRX1 \str_mem_reg[12][3]  ( .D(n2192), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3632) );
  DFFNSRX1 \str_mem_reg[11][3]  ( .D(n2184), .CKN(clk), .SN(1'b1), .RN(n2542), 
        .QN(n3636) );
  DFFNSRX1 \str_mem_reg[10][3]  ( .D(n2176), .CKN(clk), .SN(1'b1), .RN(n2541), 
        .QN(n3640) );
  DFFNSRX1 \str_mem_reg[9][3]  ( .D(n2168), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3644) );
  DFFNSRX1 \str_mem_reg[8][3]  ( .D(n2160), .CKN(clk), .SN(1'b1), .RN(n2540), 
        .QN(n3648) );
  DFFNSRX1 \str_mem_reg[6][3]  ( .D(n2144), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3656) );
  DFFNSRX1 \str_mem_reg[5][3]  ( .D(n2136), .CKN(clk), .SN(1'b1), .RN(n2538), 
        .QN(n3660) );
  DFFNSRX1 \str_mem_reg[4][3]  ( .D(n2128), .CKN(clk), .SN(1'b1), .RN(n2537), 
        .QN(n3664) );
  DFFNSRX1 \str_mem_reg[3][3]  ( .D(n2120), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3668) );
  DFFNSRX1 \str_mem_reg[2][3]  ( .D(n2112), .CKN(clk), .SN(1'b1), .RN(n2536), 
        .QN(n3672) );
  DFFNSRX1 \string_length_reg[1]  ( .D(n2021), .CKN(clk), .SN(1'b1), .RN(1'b1), 
        .Q(string_length[1]), .QN(n2386) );
  DFFNSRX1 \string_length_reg[4]  ( .D(n2027), .CKN(clk), .SN(1'b1), .RN(1'b1), 
        .Q(string_length[4]), .QN(n2387) );
  DFFNSRX1 \yn_match_reg[28]  ( .D(N456), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1370) );
  DFFNSRX1 \yn_match_reg[23]  ( .D(N451), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1365) );
  DFFNSRX1 \yn_match_reg[24]  ( .D(N452), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1364) );
  DFFNSRX1 \yn_match_reg[26]  ( .D(N454), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1362) );
  DFFNSRX1 \yn_match_reg[27]  ( .D(N455), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1361) );
  DFFNSRX1 \yn_match_reg[20]  ( .D(N448), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1368) );
  DFFNSRX1 \yn_match_reg[19]  ( .D(N447), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1369) );
  DFFNSRX1 \yn_match_reg[22]  ( .D(N450), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1366) );
  DFFNSRX1 \yn_match_reg[25]  ( .D(N453), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1363) );
  DFFNSRX1 \yn_match_reg[18]  ( .D(N446), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1357) );
  DFFNSRX1 \yn_match_reg[15]  ( .D(N443), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1352) );
  DFFNSRX1 \yn_match_reg[21]  ( .D(N449), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .QN(n1367) );
  DFFNSRX1 \yn_match_reg[17]  ( .D(N445), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1358) );
  DFFNSRX1 \yn_match_reg[11]  ( .D(N439), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1356) );
  DFFNSRX1 \yn_match_reg[13]  ( .D(N441), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1354) );
  DFFNSRX1 \yn_match_reg[14]  ( .D(N442), .CKN(clk), .SN(1'b1), .RN(n2529), 
        .QN(n1353) );
  DFFNSRX1 \yn_match_reg[10]  ( .D(N438), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1349) );
  DFFNSRX1 \yn_match_reg[9]  ( .D(N437), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1350) );
  DFFNSRX1 \yn_match_reg[6]  ( .D(N434), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1348) );
  DFFNSRX1 \yn_match_reg[5]  ( .D(N433), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1347) );
  DFFNSRX1 \yn_match_reg[4]  ( .D(N432), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1340) );
  DFFNSRX1 \yn_match_reg[3]  ( .D(N431), .CKN(clk), .SN(1'b1), .RN(n2528), 
        .QN(n1341) );
  DFFNSRX1 \compare_reg[32]  ( .D(n2037), .CKN(clk), .SN(1'b1), .RN(n2556), 
        .Q(n2385), .QN(n2047) );
  DFFNSRX1 \compare_reg[30]  ( .D(n1690), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2384), .QN(n2049) );
  DFFNSRX1 \compare_reg[31]  ( .D(n1757), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .Q(n2368), .QN(n2048) );
  DFFNSRX1 \compare_reg[-1]  ( .D(n2035), .CKN(clk), .SN(1'b1), .RN(n2556), 
        .Q(n2449), .QN(n2080) );
  DFFNSRX1 \compare_reg[25]  ( .D(n1700), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2365), .QN(n2054) );
  DFFNSRX1 \compare_reg[26]  ( .D(n1698), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2382), .QN(n2053) );
  DFFNSRX1 \compare_reg[27]  ( .D(n1696), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2366), .QN(n2052) );
  DFFNSRX1 \compare_reg[2]  ( .D(n1746), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2364), .QN(n2077) );
  DFFNSRX1 \compare_reg[29]  ( .D(n1692), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2367), .QN(n2050) );
  DFFNSRX1 \compare_reg[28]  ( .D(n1694), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2383), .QN(n2051) );
  DFFNSRX1 \compare_reg[1]  ( .D(n1748), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2381), .QN(n2078) );
  DFFNSRX1 \compare_reg[3]  ( .D(n1744), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2376), .QN(n2076) );
  DFFNSRX1 \compare_reg[0]  ( .D(n1761), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n2079) );
  DFFNSRX1 \compare_reg[20]  ( .D(n1710), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2377), .QN(n2059) );
  DFFNSRX1 \compare_reg[15]  ( .D(n1720), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2354), .QN(n2064) );
  DFFNSRX1 \compare_reg[7]  ( .D(n1736), .CKN(clk), .SN(1'b1), .RN(n2532), .Q(
        n2352), .QN(n2072) );
  DFFNSRX1 \compare_reg[6]  ( .D(n1738), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2358), .QN(n2073) );
  DFFNSRX1 \compare_reg[8]  ( .D(n1734), .CKN(clk), .SN(1'b1), .RN(n2532), .Q(
        n2373), .QN(n2071) );
  DFFNSRX1 \compare_reg[9]  ( .D(n1732), .CKN(clk), .SN(1'b1), .RN(n2532), .Q(
        n2356), .QN(n2070) );
  DFFNSRX1 \compare_reg[10]  ( .D(n1730), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2371), .QN(n2069) );
  DFFNSRX1 \compare_reg[11]  ( .D(n1728), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2355), .QN(n2068) );
  DFFNSRX1 \compare_reg[12]  ( .D(n1726), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2372), .QN(n2067) );
  DFFNSRX1 \compare_reg[13]  ( .D(n1724), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2357), .QN(n2066) );
  DFFNSRX1 \compare_reg[14]  ( .D(n1722), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2370), .QN(n2065) );
  DFFNSRX1 \compare_reg[17]  ( .D(n1716), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2360), .QN(n2062) );
  DFFNSRX1 \compare_reg[18]  ( .D(n1714), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2378), .QN(n2061) );
  DFFNSRX1 \compare_reg[19]  ( .D(n1712), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2361), .QN(n2060) );
  DFFNSRX1 \compare_reg[16]  ( .D(n1718), .CKN(clk), .SN(1'b1), .RN(n2532), 
        .Q(n2374), .QN(n2063) );
  DFFNSRX1 \compare_reg[24]  ( .D(n1702), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2379), .QN(n2055) );
  DFFNSRX1 \compare_reg[21]  ( .D(n1708), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2362), .QN(n2058) );
  DFFNSRX1 \compare_reg[22]  ( .D(n1706), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2380), .QN(n2057) );
  DFFNSRX1 \compare_reg[23]  ( .D(n1704), .CKN(clk), .SN(1'b1), .RN(n2531), 
        .Q(n2363), .QN(n2056) );
  DFFNSRX1 \compare_reg[5]  ( .D(n1740), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2375), .QN(n2074) );
  DFFNSRX1 \compare_reg[4]  ( .D(n1742), .CKN(clk), .SN(1'b1), .RN(n2533), .Q(
        n2359), .QN(n2075) );
  DFFNSRX1 \count_pat_reg[3]  ( .D(N426), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .Q(count_pat[3]), .QN(n2081) );
  DFFNSRX1 \count_pat_reg[2]  ( .D(N425), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .Q(count_pat[2]), .QN(n2082) );
  DFFNSRX1 \count_pat_reg[1]  ( .D(N424), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .Q(count_pat[1]), .QN(n2083) );
  DFFNSRX1 \match_index_reg[0]  ( .D(N200), .CKN(clk), .SN(1'b1), .RN(n2527), 
        .QN(n2389) );
  DFFNSRX1 match_reg ( .D(N254), .CKN(clk), .SN(1'b1), .RN(n2527), .QN(n2394)
         );
  DFFNSRX1 \match_index_reg[1]  ( .D(N201), .CKN(clk), .SN(1'b1), .RN(n2527), 
        .QN(n2390) );
  DFFNSRX1 \match_index_reg[2]  ( .D(N202), .CKN(clk), .SN(1'b1), .RN(n2527), 
        .QN(n2391) );
  DFFNSRX1 \match_index_reg[3]  ( .D(N203), .CKN(clk), .SN(1'b1), .RN(n2527), 
        .QN(n2392) );
  DFFNSRX1 \match_index_reg[4]  ( .D(N204), .CKN(clk), .SN(1'b1), .RN(n2527), 
        .QN(n2393) );
  DFFNSRX1 valid_reg ( .D(n2575), .CKN(clk), .SN(1'b1), .RN(n2556), .QN(n2395)
         );
  DFFNSRX1 \str_index_reg[2]  ( .D(N920), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(str_index[2]), .QN(n2706) );
  DFFNSRX1 \str_index_reg[3]  ( .D(N921), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(str_index[3]), .QN(n2676) );
  DFFNSRX1 \str_index_reg[4]  ( .D(N922), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(str_index[4]), .QN(n2694) );
  DFFNSRX1 cap_reg ( .D(n2091), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(n3780), 
        .QN(n2721) );
  DFFNSRX1 \str_mem_reg[0][5]  ( .D(n2098), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n2715) );
  DFFNSRX1 \str_mem_reg[0][3]  ( .D(n2096), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n2716) );
  DFFNSRX1 \str_mem_reg[0][2]  ( .D(n2095), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .QN(n2717) );
  DFFNSRX1 \str_mem_reg[1][5]  ( .D(n2106), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n2711) );
  DFFNSRX1 \str_mem_reg[1][3]  ( .D(n2104), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n2712) );
  DFFNSRX1 \str_mem_reg[1][2]  ( .D(n2103), .CKN(clk), .SN(1'b1), .RN(n2535), 
        .QN(n2713) );
  DFFNSRX1 \yn_match_reg[29]  ( .D(N457), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3783) );
  DFFNSRX1 \yn_match_reg[32]  ( .D(N460), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3779) );
  DFFNSRX1 \yn_match_reg[30]  ( .D(N458), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3782) );
  DFFNSRX1 \yn_match_reg[1]  ( .D(N429), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(
        n3788) );
  DFFNSRX1 \yn_match_reg[7]  ( .D(N435), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(
        n3786) );
  DFFNSRX1 \yn_match_reg[31]  ( .D(N459), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3781) );
  DFFNSRX1 \yn_match_reg[0]  ( .D(N428), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(
        n3790) );
  DFFNSRX1 \yn_match_reg[-1]  ( .D(N427), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3789) );
  DFFNSRX1 \yn_match_reg[2]  ( .D(N430), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(
        n3787) );
  DFFNSRX1 \yn_match_reg[16]  ( .D(N444), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3791) );
  DFFNSRX1 \yn_match_reg[12]  ( .D(N440), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(n3784) );
  DFFNSRX1 \yn_match_reg[8]  ( .D(N436), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(
        n3785) );
  DFFNSRX1 star_reg ( .D(n2092), .CKN(clk), .SN(1'b1), .RN(n3792), .Q(star), 
        .QN(n2719) );
  DFFNSRX1 \star_index_reg[0]  ( .D(n2040), .CKN(clk), .SN(1'b1), .RN(n2533), 
        .Q(star_index[0]), .QN(n2738) );
  DFFNSRX1 \star_index_reg[1]  ( .D(n2041), .CKN(clk), .SN(1'b1), .RN(n2533), 
        .Q(star_index[1]), .QN(n2736) );
  DFFNSRX1 \star_index_reg[2]  ( .D(n2042), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(star_index[2]), .QN(n2734) );
  DFFNSRX4 \star_index_reg[4]  ( .D(n2044), .CKN(clk), .SN(1'b1), .RN(n2534), 
        .Q(star_index[4]), .QN(n2728) );
  DFFNSRX2 \star_index_reg[3]  ( .D(n2043), .CKN(clk), .SN(1'b1), .RN(n2533), 
        .Q(star_index[3]), .QN(n2732) );
  DFFNSRX2 \str_index_reg[0]  ( .D(N918), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(str_index[0]), .QN(N540) );
  DFFNSRX2 \str_index_reg[1]  ( .D(N919), .CKN(clk), .SN(1'b1), .RN(n3792), 
        .Q(str_index[1]), .QN(n2701) );
  DFFNSRX1 \count_pat_reg[0]  ( .D(N423), .CKN(clk), .SN(1'b1), .RN(n2530), 
        .Q(count_pat[0]), .QN(n1373) );
  AOI22X2 U1774 ( .A0(n3789), .A1(n3421), .B0(n2517), .B1(n2449), .Y(n3228) );
  NAND2BX1 U1775 ( .AN(n3330), .B(n2447), .Y(n2434) );
  OR2X1 U1776 ( .A(count_pat[1]), .B(count_pat[0]), .Y(n2597) );
  NAND4X1 U1777 ( .A(n3234), .B(n2082), .C(n3521), .D(n2081), .Y(n2437) );
  NOR2X1 U1778 ( .A(chardata[2]), .B(n3186), .Y(n3521) );
  CLKBUFX3 U1779 ( .A(n2441), .Y(n2525) );
  NOR2X1 U1780 ( .A(n2495), .B(n2577), .Y(n2350) );
  OR2X1 U1781 ( .A(n3186), .B(n2577), .Y(n2448) );
  NOR2X1 U1782 ( .A(n2577), .B(chardata[2]), .Y(n2351) );
  CLKBUFX3 U1783 ( .A(n2439), .Y(n2523) );
  OA21XL U1784 ( .A0(n2577), .A1(n2722), .B0(n2613), .Y(n2353) );
  CLKBUFX3 U1785 ( .A(n2441), .Y(n2524) );
  CLKINVX1 U1786 ( .A(chardata[0]), .Y(n2620) );
  OAI221X1 U1787 ( .A0(n2522), .A1(n2367), .B0(n2441), .B1(n2384), .C0(n3508), 
        .Y(n3347) );
  OAI221X1 U1788 ( .A0(n2522), .A1(n2365), .B0(n2525), .B1(n2382), .C0(n3507), 
        .Y(n3354) );
  OAI221X1 U1789 ( .A0(n2522), .A1(n2382), .B0(n2525), .B1(n2366), .C0(n3510), 
        .Y(n3382) );
  OAI221X1 U1790 ( .A0(n2523), .A1(n2374), .B0(n2525), .B1(n2360), .C0(n3470), 
        .Y(n3397) );
  OAI222XL U1791 ( .A0(n3363), .A1(n2487), .B0(n2484), .B1(n3343), .C0(n3362), 
        .C1(n2486), .Y(n3474) );
  OAI221X1 U1792 ( .A0(n2522), .A1(n2366), .B0(n2525), .B1(n2383), .C0(n3503), 
        .Y(n3363) );
  INVX12 U1793 ( .A(n2395), .Y(valid) );
  INVX12 U1794 ( .A(n2393), .Y(match_index[4]) );
  INVX12 U1795 ( .A(n2392), .Y(match_index[3]) );
  INVX12 U1796 ( .A(n2391), .Y(match_index[2]) );
  INVX12 U1797 ( .A(n2390), .Y(match_index[1]) );
  INVX12 U1798 ( .A(n2394), .Y(match) );
  INVX12 U1799 ( .A(n2389), .Y(match_index[0]) );
  INVX3 U1800 ( .A(reset), .Y(n3792) );
  OAI22X1 U1831 ( .A0(n2065), .A1(n2515), .B0(n3378), .B1(n1353), .Y(n3213) );
  OAI221X1 U1832 ( .A0(n2523), .A1(n2371), .B0(n2524), .B1(n2355), .C0(n3446), 
        .Y(n3405) );
  OAI22X1 U1833 ( .A0(n2060), .A1(n2516), .B0(n3472), .B1(n1369), .Y(n3258) );
  OAI221X1 U1834 ( .A0(n2522), .A1(n2384), .B0(n2525), .B1(n2368), .C0(n3511), 
        .Y(n3345) );
  OAI221X1 U1835 ( .A0(n2523), .A1(n2354), .B0(n2524), .B1(n2374), .C0(n3460), 
        .Y(n3365) );
  OAI2BB1X2 U1836 ( .A0N(n2597), .A1N(count_pat[2]), .B0(n2598), .Y(N210) );
  OAI221X1 U1837 ( .A0(n2522), .A1(n2378), .B0(n2525), .B1(n2361), .C0(n3480), 
        .Y(n3383) );
  OAI22X1 U1838 ( .A0(n2070), .A1(n2515), .B0(n3389), .B1(n1350), .Y(n3218) );
  OAI221X1 U1839 ( .A0(n2522), .A1(n2377), .B0(n2525), .B1(n2362), .C0(n3491), 
        .Y(n3377) );
  AND2XL U1840 ( .A(n2627), .B(n2632), .Y(n2633) );
  NOR3XL U1841 ( .A(n3321), .B(n3213), .C(n3307), .Y(n3339) );
  OAI22X1 U1842 ( .A0(n2066), .A1(n2515), .B0(n3385), .B1(n1354), .Y(n3321) );
  OAI221X1 U1843 ( .A0(n2522), .A1(n2361), .B0(n2525), .B1(n2377), .C0(n3475), 
        .Y(n3364) );
  NAND3X2 U1844 ( .A(N540), .B(n2701), .C(str_index[2]), .Y(n2632) );
  OAI22X1 U1845 ( .A0(n2073), .A1(n2515), .B0(n3444), .B1(n1348), .Y(n3221) );
  OAI221X1 U1846 ( .A0(n2523), .A1(n2360), .B0(n2524), .B1(n2378), .C0(n3453), 
        .Y(n3358) );
  OAI221X1 U1847 ( .A0(n2522), .A1(n2380), .B0(n2525), .B1(n2363), .C0(n3487), 
        .Y(n3381) );
  CLKINVX1 U1848 ( .A(n2633), .Y(n2433) );
  NOR2BXL U1849 ( .AN(n2433), .B(n2675), .Y(n2681) );
  NOR2BXL U1850 ( .AN(n2433), .B(n2658), .Y(n2663) );
  NOR2BXL U1851 ( .AN(n2433), .B(n2693), .Y(n2699) );
  NAND2X1 U1852 ( .A(n2637), .B(n2642), .Y(n2643) );
  NAND3X2 U1853 ( .A(N540), .B(n2706), .C(str_index[1]), .Y(n2642) );
  NAND3X2 U1854 ( .A(str_index[1]), .B(n2706), .C(str_index[0]), .Y(n2637) );
  NAND2X2 U1855 ( .A(N210), .B(n3468), .Y(n3375) );
  AOI221X1 U1856 ( .A0(n3282), .A1(n3283), .B0(n2721), .B1(n3255), .C0(n3284), 
        .Y(n3270) );
  NOR3BX1 U1857 ( .AN(n3283), .B(n3282), .C(n3212), .Y(n3255) );
  OAI22X1 U1858 ( .A0(n2054), .A1(n2516), .B0(n3506), .B1(n1363), .Y(n3261) );
  OAI221X1 U1859 ( .A0(n2522), .A1(n2362), .B0(n2525), .B1(n2380), .C0(n3496), 
        .Y(n3357) );
  NAND3X2 U1860 ( .A(str_index[1]), .B(N540), .C(str_index[2]), .Y(n2621) );
  NAND3X2 U1861 ( .A(str_index[3]), .B(isstring), .C(str_index[4]), .Y(n2623)
         );
  OAI221X1 U1862 ( .A0(n2523), .A1(n2356), .B0(n2524), .B1(n2371), .C0(n3452), 
        .Y(n3392) );
  OAI22X1 U1863 ( .A0(n2062), .A1(n2515), .B0(n3348), .B1(n1358), .Y(n3210) );
  OAI221X1 U1864 ( .A0(n2522), .A1(n2379), .B0(n2525), .B1(n2365), .C0(n3517), 
        .Y(n3374) );
  NAND2X1 U1865 ( .A(n2642), .B(n2647), .Y(n2648) );
  NAND3X2 U1866 ( .A(n2701), .B(n2706), .C(str_index[0]), .Y(n2647) );
  NAND2X1 U1867 ( .A(n2657), .B(n2621), .Y(n2622) );
  NAND3X2 U1868 ( .A(str_index[2]), .B(str_index[1]), .C(str_index[0]), .Y(
        n2657) );
  OAI211X1 U1869 ( .A0(n3239), .A1(n3301), .B0(n3299), .C0(n3302), .Y(
        \gt_100/A[0] ) );
  OAI22X1 U1870 ( .A0(n2058), .A1(n2516), .B0(n3492), .B1(n1367), .Y(n3266) );
  OAI221X1 U1871 ( .A0(n2522), .A1(n2363), .B0(n2379), .B1(n2524), .C0(n3501), 
        .Y(n3362) );
  OAI221X1 U1872 ( .A0(n2523), .A1(n2370), .B0(n2524), .B1(n2354), .C0(n3447), 
        .Y(n3384) );
  NOR2BX2 U1873 ( .AN(n3471), .B(N210), .Y(n3372) );
  OAI31X1 U1874 ( .A0(n3186), .A1(chardata[2]), .A2(n2740), .B0(n2579), .Y(
        n3229) );
  NAND3X1 U1875 ( .A(n3217), .B(n3216), .C(n3323), .Y(n3275) );
  CLKINVX1 U1876 ( .A(n2434), .Y(n3272) );
  NAND3X1 U1877 ( .A(n3220), .B(n3341), .C(n3280), .Y(n3317) );
  CLKBUFX3 U1878 ( .A(N209), .Y(n2452) );
  OR2XL U1879 ( .A(n2523), .B(n2372), .Y(n2435) );
  OR2XL U1880 ( .A(n2524), .B(n2357), .Y(n2436) );
  NAND3X1 U1881 ( .A(n2435), .B(n2436), .C(n3442), .Y(n3398) );
  CLKINVX1 U1882 ( .A(n3324), .Y(n3217) );
  CLKINVX1 U1883 ( .A(n3338), .Y(n3216) );
  NAND2X1 U1884 ( .A(chardata[3]), .B(n2497), .Y(n2444) );
  NAND2XL U1885 ( .A(n3520), .B(n3505), .Y(n2439) );
  OA22XL U1886 ( .A0(n2519), .A1(n2370), .B0(n2521), .B1(n2357), .Y(n3462) );
  NOR3XL U1887 ( .A(n3229), .B(n3232), .C(n3234), .Y(N424) );
  NAND2X1 U1888 ( .A(n2632), .B(n2637), .Y(n2638) );
  NAND2X1 U1889 ( .A(n2621), .B(n2627), .Y(n2628) );
  NAND4X4 U1890 ( .A(n3234), .B(n2082), .C(n3521), .D(n2081), .Y(n2438) );
  INVX3 U1891 ( .A(n2485), .Y(n3350) );
  NOR2BX1 U1892 ( .AN(n3471), .B(n3368), .Y(n3516) );
  INVXL U1893 ( .A(n3354), .Y(n3494) );
  INVXL U1894 ( .A(n3347), .Y(n3493) );
  INVXL U1895 ( .A(n3382), .Y(n3484) );
  INVXL U1896 ( .A(n3363), .Y(n3499) );
  NAND2X1 U1897 ( .A(n3264), .B(n3198), .Y(n3239) );
  NAND3X1 U1898 ( .A(n3228), .B(n3226), .C(n3227), .Y(n3335) );
  NOR2BX1 U1899 ( .AN(n3211), .B(n3259), .Y(n3332) );
  INVXL U1900 ( .A(n3266), .Y(n3206) );
  CLKBUFX3 U1901 ( .A(n3356), .Y(n2486) );
  CLKBUFX3 U1902 ( .A(n3355), .Y(n2484) );
  CLKINVX1 U1903 ( .A(n3309), .Y(n3226) );
  OAI221X1 U1904 ( .A0(n2523), .A1(n2357), .B0(n2524), .B1(n2370), .C0(n3454), 
        .Y(n3388) );
  NOR3XL U1905 ( .A(n3329), .B(n3316), .C(n3261), .Y(n3336) );
  INVXL U1906 ( .A(n3258), .Y(n3208) );
  INVXL U1907 ( .A(n3345), .Y(n3482) );
  NOR2XL U1908 ( .A(n3520), .B(n3229), .Y(N423) );
  NOR2XL U1909 ( .A(n3229), .B(n3230), .Y(N426) );
  INVXL U1910 ( .A(n3261), .Y(n3202) );
  NOR2XL U1911 ( .A(n2576), .B(n3207), .Y(N448) );
  AND2XL U1912 ( .A(n3210), .B(ispattern), .Y(N445) );
  NAND2XL U1913 ( .A(n2647), .B(n2652), .Y(n2653) );
  NAND3BX1 U1914 ( .AN(n3294), .B(n3260), .C(n3304), .Y(n3303) );
  OAI22XL U1915 ( .A0(n3242), .A1(n3243), .B0(string_length[4]), .B1(n2723), 
        .Y(n3237) );
  NOR3X1 U1916 ( .A(n2581), .B(chardata[7]), .C(n2507), .Y(n3184) );
  NOR2XL U1917 ( .A(n3229), .B(n3233), .Y(N425) );
  OAI32XL U1918 ( .A0(n3140), .A1(n2498), .A2(n3141), .B0(n2734), .B1(n2990), 
        .Y(n3139) );
  MX2X1 U1919 ( .A(string_length[1]), .B(str_index[1]), .S0(n2742), .Y(n2021)
         );
  MX2XL U1920 ( .A(string_length[4]), .B(str_index[4]), .S0(n2742), .Y(n2027)
         );
  INVX1 U1921 ( .A(n3376), .Y(n3409) );
  INVX1 U1922 ( .A(n2487), .Y(n3483) );
  INVX1 U1923 ( .A(n3436), .Y(n3424) );
  INVX1 U1924 ( .A(n3413), .Y(n3395) );
  INVXL U1925 ( .A(n3397), .Y(n3369) );
  INVXL U1926 ( .A(n3398), .Y(n3371) );
  INVX1 U1927 ( .A(N215), .Y(n2610) );
  INVXL U1928 ( .A(n3339), .Y(n3282) );
  NAND2X1 U1929 ( .A(n2493), .B(n2497), .Y(n2440) );
  NAND3X1 U1930 ( .A(n3209), .B(n3208), .C(n3313), .Y(n3330) );
  OA22XL U1931 ( .A0(n2518), .A1(n2360), .B0(n2520), .B1(n2374), .Y(n3447) );
  OAI221X1 U1932 ( .A0(n2523), .A1(n2355), .B0(n2525), .B1(n2372), .C0(n3462), 
        .Y(n3427) );
  OA22XL U1933 ( .A0(n2518), .A1(n2354), .B0(n2520), .B1(n2370), .Y(n3442) );
  OA22XL U1934 ( .A0(n2518), .A1(n2372), .B0(n2520), .B1(n2355), .Y(n3452) );
  OA22XL U1935 ( .A0(n2518), .A1(n2358), .B0(n2520), .B1(n2375), .Y(n3437) );
  OA22XL U1936 ( .A0(n2518), .A1(n2352), .B0(n2520), .B1(n2358), .Y(n3443) );
  OA22XL U1937 ( .A0(n2519), .A1(n2371), .B0(n2521), .B1(n2356), .Y(n3461) );
  OA22XL U1938 ( .A0(n2518), .A1(n2355), .B0(n2520), .B1(n2371), .Y(n3441) );
  NAND2XL U1939 ( .A(N208), .B(n3505), .Y(n2441) );
  NAND2XL U1940 ( .A(n2452), .B(n3520), .Y(n2442) );
  OA22XL U1941 ( .A0(n2519), .A1(n2380), .B0(n2521), .B1(n2362), .Y(n3475) );
  OA22XL U1942 ( .A0(n2519), .A1(n2363), .B0(n2521), .B1(n2380), .Y(n3491) );
  OA22XL U1943 ( .A0(n2518), .A1(n2377), .B0(n2520), .B1(n2361), .Y(n3453) );
  OA22XL U1944 ( .A0(n2519), .A1(n2362), .B0(n2521), .B1(n2377), .Y(n3480) );
  OA22XL U1945 ( .A0(n2519), .A1(n2378), .B0(n2521), .B1(n2360), .Y(n3460) );
  OA22XL U1946 ( .A0(n2519), .A1(n2366), .B0(n2521), .B1(n2382), .Y(n3517) );
  OA22XL U1947 ( .A0(n2379), .A1(n2518), .B0(n2521), .B1(n2363), .Y(n3496) );
  OA22XL U1948 ( .A0(n2519), .A1(n2361), .B0(n2521), .B1(n2378), .Y(n3470) );
  OA22XL U1949 ( .A0(n2519), .A1(n2367), .B0(n2520), .B1(n2383), .Y(n3510) );
  OA22XL U1950 ( .A0(n2519), .A1(n2383), .B0(n2521), .B1(n2366), .Y(n3507) );
  OA22XL U1951 ( .A0(n2519), .A1(n2357), .B0(n2521), .B1(n2372), .Y(n3446) );
  AOI211XL U1952 ( .A0(n3264), .A1(n3238), .B0(n3286), .C0(n3263), .Y(n3285)
         );
  NOR3XL U1953 ( .A(n3261), .B(n3201), .C(n2434), .Y(n3297) );
  INVX1 U1954 ( .A(N210), .Y(n3469) );
  NAND2XL U1955 ( .A(n3264), .B(n3265), .Y(n3252) );
  NOR2BXL U1956 ( .AN(n3262), .B(n3263), .Y(n3253) );
  AOI22XL U1957 ( .A0(N284), .A1(n2730), .B0(N289), .B1(n2731), .Y(n2735) );
  NAND4XL U1958 ( .A(n3268), .B(n3206), .C(n3207), .D(n3300), .Y(n3289) );
  AND2XL U1959 ( .A(n3298), .B(n3299), .Y(n3290) );
  NAND2BXL U1960 ( .AN(n3239), .B(n3238), .Y(n3288) );
  AOI22XL U1961 ( .A0(N283), .A1(n2730), .B0(N288), .B1(n2731), .Y(n2737) );
  AO21XL U1962 ( .A0(N282), .A1(N283), .B0(n2599), .Y(N288) );
  NAND2XL U1963 ( .A(n3471), .B(N210), .Y(n3411) );
  AOI33XL U1964 ( .A0(n3219), .A1(n3218), .A2(n3274), .B0(n3223), .B1(n3322), 
        .B2(n3280), .Y(n3326) );
  AOI32XL U1965 ( .A0(n3228), .A1(n3309), .A2(n3227), .B0(n3332), .B1(n3210), 
        .Y(n3325) );
  AOI33XL U1966 ( .A0(n3207), .A1(n3266), .A2(n3268), .B0(n3215), .B1(n3321), 
        .B2(n3283), .Y(n3327) );
  NAND4XL U1967 ( .A(n3274), .B(n3323), .C(n3217), .D(n3338), .Y(n3333) );
  AOI33XL U1968 ( .A0(n3209), .A1(n3258), .A2(n3313), .B0(n3225), .B1(n3224), 
        .B2(n3296), .Y(n3334) );
  INVX1 U1969 ( .A(n3448), .Y(n3431) );
  OA22XL U1970 ( .A0(n2518), .A1(n2356), .B0(n2520), .B1(n2373), .Y(n3449) );
  INVX1 U1971 ( .A(n3455), .Y(n3418) );
  OA22XL U1972 ( .A0(n2518), .A1(n2373), .B0(n2520), .B1(n2352), .Y(n3456) );
  INVX1 U1973 ( .A(N284), .Y(n2602) );
  NAND2X1 U1974 ( .A(n2452), .B(N208), .Y(n2443) );
  OA22XL U1975 ( .A0(n2519), .A1(n2384), .B0(n2521), .B1(n2367), .Y(n3503) );
  OA22XL U1976 ( .A0(n2518), .A1(n2368), .B0(n2520), .B1(n2384), .Y(n3519) );
  INVXL U1977 ( .A(n3280), .Y(n3340) );
  INVXL U1978 ( .A(\gt_100/A[0] ), .Y(n2727) );
  OA22XL U1979 ( .A0(n2519), .A1(n2385), .B0(n2521), .B1(n2368), .Y(n3508) );
  NAND2XL U1980 ( .A(n2388), .B(match_index_ns[2]), .Y(n3245) );
  INVXL U1981 ( .A(match_index_ns[2]), .Y(n2725) );
  MX2XL U1982 ( .A(n3513), .B(n3514), .S0(n3469), .Y(n3489) );
  AOI2BB1XL U1983 ( .A0N(n3224), .A1N(n3223), .B0(n3295), .Y(n3308) );
  OAI211XL U1984 ( .A0(n3317), .A1(n3318), .B0(n3319), .C0(n3320), .Y(n3294)
         );
  NAND2XL U1985 ( .A(n3323), .B(n3324), .Y(n3318) );
  NAND4XL U1986 ( .A(n3280), .B(n3223), .C(n3222), .D(n3221), .Y(n3319) );
  NAND4XL U1987 ( .A(n3283), .B(n3215), .C(n3214), .D(n3213), .Y(n3320) );
  INVX1 U1988 ( .A(n3331), .Y(n3223) );
  INVXL U1989 ( .A(n3321), .Y(n3214) );
  INVXL U1990 ( .A(n3295), .Y(n3225) );
  INVXL U1991 ( .A(n3305), .Y(n3219) );
  NOR2BXL U1992 ( .AN(n3224), .B(n2577), .Y(N431) );
  NOR2BXL U1993 ( .AN(n3221), .B(n2577), .Y(N434) );
  NOR2BXL U1994 ( .AN(n3218), .B(n2577), .Y(N437) );
  NOR2BXL U1995 ( .AN(n3213), .B(n2577), .Y(N442) );
  NOR2XL U1996 ( .A(n2575), .B(n3227), .Y(N428) );
  NOR2XL U1997 ( .A(n2575), .B(n3220), .Y(N435) );
  INVX2 U1998 ( .A(count_pat[0]), .Y(N208) );
  OAI22X1 U1999 ( .A0(n2074), .A1(n2515), .B0(n3450), .B1(n1347), .Y(n3322) );
  OAI222XL U2000 ( .A0(n2487), .A1(n3388), .B0(n2484), .B1(n3358), .C0(n2486), 
        .C1(n3392), .Y(n3451) );
  INVXL U2001 ( .A(N217), .Y(n2612) );
  AND2X2 U2002 ( .A(string_length[3]), .B(n2611), .Y(n2603) );
  INVXL U2003 ( .A(n3358), .Y(n3349) );
  AOI22XL U2004 ( .A0(n3279), .A1(n3268), .B0(n3280), .B1(n3281), .Y(n3278) );
  INVXL U2005 ( .A(n3388), .Y(n3386) );
  OR2XL U2006 ( .A(n2597), .B(count_pat[2]), .Y(n2598) );
  INVXL U2007 ( .A(n3365), .Y(n3360) );
  AOI211XL U2008 ( .A0(n3780), .A1(n3255), .B0(n3256), .C0(n3257), .Y(n3254)
         );
  AOI2BB1XL U2009 ( .A0N(n3210), .A1N(n3258), .B0(n3259), .Y(n3257) );
  AO22XL U2010 ( .A0(n3295), .A1(n3296), .B0(n3203), .B1(n3297), .Y(n3293) );
  CLKINVX1 U2011 ( .A(chardata[1]), .Y(n2583) );
  CLKINVX1 U2012 ( .A(chardata[5]), .Y(n2591) );
  INVXL U2013 ( .A(n3383), .Y(n3477) );
  INVXL U2014 ( .A(n3377), .Y(n3465) );
  INVXL U2015 ( .A(n3364), .Y(n3473) );
  MXI3XL U2016 ( .A(n2079), .B(n2080), .C(n3420), .S0(n3520), .S1(n2452), .Y(
        n3423) );
  NAND2XL U2017 ( .A(n3504), .B(n3505), .Y(n3343) );
  MXI2XL U2018 ( .A(n2048), .B(n2047), .S0(N208), .Y(n3504) );
  AOI2BB2XL U2019 ( .B0(n3516), .B1(n3489), .A0N(n2051), .A1N(n2438), .Y(n3518) );
  NOR3XL U2020 ( .A(n1373), .B(n2047), .C(n2452), .Y(n3513) );
  NAND3X2 U2021 ( .A(isstring), .B(n2676), .C(str_index[4]), .Y(n2658) );
  NAND3X2 U2022 ( .A(isstring), .B(n2694), .C(str_index[3]), .Y(n2675) );
  NAND3X2 U2023 ( .A(n2676), .B(n2694), .C(isstring), .Y(n2693) );
  AOI21XL U2024 ( .A0(n3527), .A1(n2438), .B0(n2577), .Y(n2085) );
  MX4XL U2025 ( .A(n2503), .B(n2506), .C(n2507), .D(n2509), .S0(n3592), .S1(
        n3593), .Y(n3078) );
  MX4XL U2026 ( .A(n2503), .B(n2506), .C(n2507), .D(n2509), .S0(n3596), .S1(
        n3597), .Y(n3064) );
  MX4XL U2027 ( .A(n2503), .B(n2506), .C(n2507), .D(n2509), .S0(n3600), .S1(
        n3601), .Y(n3050) );
  MX4XL U2028 ( .A(n2503), .B(n2506), .C(n2507), .D(n2509), .S0(n3604), .S1(
        n3605), .Y(n3036) );
  NAND2XL U2029 ( .A(chardata[0]), .B(n2493), .Y(n2445) );
  MX4XL U2030 ( .A(n2503), .B(n2506), .C(n2507), .D(n2509), .S0(n3588), .S1(
        n3589), .Y(n3091) );
  MXI2XL U2031 ( .A(n2497), .B(n3682), .S0(n2714), .Y(n2093) );
  XOR2XL U2032 ( .A(n3682), .B(chardata[0]), .Y(n2755) );
  MX4XL U2033 ( .A(n2503), .B(n2445), .C(n2507), .D(n2509), .S0(n3560), .S1(
        n3561), .Y(n3188) );
  MX4XL U2034 ( .A(n2503), .B(n2506), .C(n2507), .D(n2510), .S0(n3564), .S1(
        n3565), .Y(n3171) );
  MX4XL U2035 ( .A(n2503), .B(n2506), .C(n2507), .D(n2510), .S0(n3568), .S1(
        n3569), .Y(n3158) );
  MX4XL U2036 ( .A(n2503), .B(n2505), .C(n2507), .D(n2510), .S0(n3572), .S1(
        n3573), .Y(n3145) );
  MX4XL U2037 ( .A(n2503), .B(n2445), .C(n2507), .D(n2510), .S0(n3576), .S1(
        n3577), .Y(n3132) );
  MX4XL U2038 ( .A(n2503), .B(n2506), .C(n2507), .D(n2510), .S0(n3580), .S1(
        n3581), .Y(n3119) );
  MX4XL U2039 ( .A(n2503), .B(n2506), .C(n2507), .D(n2510), .S0(n3584), .S1(
        n3585), .Y(n3106) );
  XOR2XL U2040 ( .A(n2716), .B(chardata[3]), .Y(n2757) );
  XOR2XL U2041 ( .A(n2712), .B(chardata[3]), .Y(n2787) );
  XOR2XL U2042 ( .A(n3676), .B(chardata[0]), .Y(n2785) );
  NAND2XL U2043 ( .A(chardata[0]), .B(chardata[3]), .Y(n2446) );
  NOR2XL U2044 ( .A(n3279), .B(n3267), .Y(n2447) );
  OAI22X1 U2045 ( .A0(n2056), .A1(n2516), .B0(n3497), .B1(n1365), .Y(n3267) );
  NAND3XL U2046 ( .A(n3206), .B(n3207), .C(n3205), .Y(n3279) );
  NAND3XL U2047 ( .A(n3336), .B(n3337), .C(n3272), .Y(n3262) );
  AOI22XL U2048 ( .A0(n3272), .A1(n3273), .B0(n3274), .B1(n3275), .Y(n3271) );
  AOI31XL U2049 ( .A0(n3203), .A1(n3261), .A2(n3272), .B0(n3263), .Y(n3328) );
  CLKBUFX3 U2050 ( .A(n2440), .Y(n2510) );
  CLKBUFX3 U2051 ( .A(n2511), .Y(n2512) );
  CLKBUFX3 U2052 ( .A(n2565), .Y(n2533) );
  CLKBUFX3 U2053 ( .A(n2565), .Y(n2534) );
  CLKBUFX3 U2054 ( .A(n2564), .Y(n2535) );
  CLKBUFX3 U2055 ( .A(n2564), .Y(n2536) );
  CLKBUFX3 U2056 ( .A(n2563), .Y(n2537) );
  CLKBUFX3 U2057 ( .A(n2563), .Y(n2538) );
  CLKBUFX3 U2058 ( .A(n2562), .Y(n2539) );
  CLKBUFX3 U2059 ( .A(n2562), .Y(n2540) );
  CLKBUFX3 U2060 ( .A(n2561), .Y(n2541) );
  CLKBUFX3 U2061 ( .A(n2561), .Y(n2542) );
  CLKBUFX3 U2062 ( .A(n2560), .Y(n2543) );
  CLKBUFX3 U2063 ( .A(n2560), .Y(n2544) );
  CLKBUFX3 U2064 ( .A(n2559), .Y(n2545) );
  CLKBUFX3 U2065 ( .A(n2559), .Y(n2546) );
  CLKBUFX3 U2066 ( .A(n2558), .Y(n2547) );
  CLKBUFX3 U2067 ( .A(n2558), .Y(n2548) );
  CLKBUFX3 U2068 ( .A(n2557), .Y(n2549) );
  CLKBUFX3 U2069 ( .A(n2557), .Y(n2550) );
  CLKBUFX3 U2070 ( .A(n2571), .Y(n2551) );
  CLKBUFX3 U2071 ( .A(n2565), .Y(n2552) );
  CLKBUFX3 U2072 ( .A(n2571), .Y(n2553) );
  CLKBUFX3 U2073 ( .A(n2573), .Y(n2554) );
  CLKBUFX3 U2074 ( .A(n2571), .Y(n2555) );
  CLKBUFX3 U2075 ( .A(n2572), .Y(n2556) );
  CLKBUFX3 U2076 ( .A(n2523), .Y(n2522) );
  CLKBUFX3 U2077 ( .A(n2442), .Y(n2521) );
  CLKBUFX3 U2078 ( .A(n2443), .Y(n2519) );
  INVX3 U2079 ( .A(n2502), .Y(n2501) );
  INVX3 U2080 ( .A(n2502), .Y(n2500) );
  INVX3 U2081 ( .A(n2448), .Y(n2498) );
  CLKBUFX3 U2082 ( .A(n2350), .Y(n2511) );
  INVX3 U2083 ( .A(n2448), .Y(n2499) );
  CLKBUFX3 U2084 ( .A(n2510), .Y(n2509) );
  CLKBUFX3 U2085 ( .A(n2574), .Y(n2527) );
  CLKBUFX3 U2086 ( .A(n2567), .Y(n2528) );
  CLKBUFX3 U2087 ( .A(n2567), .Y(n2529) );
  CLKBUFX3 U2088 ( .A(n2574), .Y(n2530) );
  CLKBUFX3 U2089 ( .A(n2566), .Y(n2531) );
  CLKBUFX3 U2090 ( .A(n2566), .Y(n2532) );
  CLKBUFX3 U2091 ( .A(n2568), .Y(n2565) );
  CLKBUFX3 U2092 ( .A(n2568), .Y(n2564) );
  CLKBUFX3 U2093 ( .A(n2568), .Y(n2563) );
  CLKBUFX3 U2094 ( .A(n2569), .Y(n2562) );
  CLKBUFX3 U2095 ( .A(n2569), .Y(n2561) );
  CLKBUFX3 U2096 ( .A(n2569), .Y(n2560) );
  CLKBUFX3 U2097 ( .A(n2570), .Y(n2559) );
  CLKBUFX3 U2098 ( .A(n2570), .Y(n2558) );
  CLKBUFX3 U2099 ( .A(n2570), .Y(n2557) );
  CLKBUFX3 U2100 ( .A(n3353), .Y(n2487) );
  NAND2X1 U2101 ( .A(n3479), .B(n3469), .Y(n3353) );
  CLKBUFX3 U2102 ( .A(n2443), .Y(n2518) );
  CLKBUFX3 U2103 ( .A(n2442), .Y(n2520) );
  CLKINVX1 U2104 ( .A(N216), .Y(n2611) );
  CLKBUFX3 U2105 ( .A(n3241), .Y(n2485) );
  NAND2X1 U2106 ( .A(n3516), .B(n3469), .Y(n3241) );
  NAND3BX2 U2107 ( .AN(n2740), .B(n2495), .C(n2498), .Y(n2720) );
  INVX3 U2108 ( .A(n2517), .Y(n2515) );
  INVX3 U2109 ( .A(n2517), .Y(n2516) );
  CLKBUFX3 U2110 ( .A(n2353), .Y(n2502) );
  INVX3 U2111 ( .A(n2595), .Y(n2592) );
  INVX3 U2112 ( .A(n2587), .Y(n2584) );
  INVX3 U2113 ( .A(n2582), .Y(n2580) );
  CLKBUFX3 U2114 ( .A(n2507), .Y(n2508) );
  CLKBUFX3 U2115 ( .A(n2488), .Y(n2490) );
  CLKBUFX3 U2116 ( .A(n2351), .Y(n2514) );
  CLKBUFX3 U2117 ( .A(n2488), .Y(n2489) );
  INVX3 U2118 ( .A(n2586), .Y(n2585) );
  CLKBUFX3 U2119 ( .A(n2506), .Y(n2505) );
  CLKBUFX3 U2120 ( .A(n2488), .Y(n2491) );
  CLKBUFX3 U2121 ( .A(n2620), .Y(n2496) );
  INVX3 U2122 ( .A(n2594), .Y(n2593) );
  CLKBUFX3 U2123 ( .A(n2567), .Y(n2566) );
  CLKBUFX3 U2124 ( .A(n2573), .Y(n2568) );
  CLKBUFX3 U2125 ( .A(n2573), .Y(n2569) );
  CLKBUFX3 U2126 ( .A(n2572), .Y(n2570) );
  CLKBUFX3 U2127 ( .A(n2572), .Y(n2571) );
  NOR3X2 U2128 ( .A(n3224), .B(n3295), .C(n3335), .Y(n3280) );
  NAND2X2 U2129 ( .A(n2437), .B(n2515), .Y(n3368) );
  NAND2XL U2130 ( .A(n3516), .B(N210), .Y(n3356) );
  NAND2XL U2131 ( .A(n3479), .B(N210), .Y(n3355) );
  CLKBUFX3 U2132 ( .A(n2444), .Y(n2507) );
  CLKBUFX3 U2133 ( .A(n2620), .Y(n2497) );
  CLKBUFX3 U2134 ( .A(n2583), .Y(n2581) );
  NAND2X2 U2135 ( .A(n2720), .B(n2579), .Y(n2718) );
  CLKBUFX3 U2136 ( .A(n2596), .Y(n2595) );
  CLKBUFX3 U2137 ( .A(n2588), .Y(n2586) );
  CLKBUFX3 U2138 ( .A(n2450), .Y(n2517) );
  INVX3 U2139 ( .A(n2438), .Y(n3351) );
  INVX3 U2140 ( .A(n2591), .Y(n2589) );
  CLKBUFX3 U2141 ( .A(n2494), .Y(n2495) );
  CLKBUFX3 U2142 ( .A(n2492), .Y(n2493) );
  CLKBUFX3 U2143 ( .A(n2709), .Y(n2483) );
  OAI21XL U2144 ( .A0(n2693), .A1(n2647), .B0(n2714), .Y(n2709) );
  CLKBUFX3 U2145 ( .A(n2596), .Y(n2594) );
  CLKBUFX3 U2146 ( .A(n2588), .Y(n2587) );
  CLKBUFX3 U2147 ( .A(n2583), .Y(n2582) );
  INVX3 U2148 ( .A(n2578), .Y(n2577) );
  CLKBUFX3 U2149 ( .A(n2654), .Y(n2460) );
  OAI22XL U2150 ( .A0(n2658), .A1(n2657), .B0(n2623), .B1(n2652), .Y(n2654) );
  CLKBUFX3 U2151 ( .A(n2649), .Y(n2459) );
  NOR2BXL U2152 ( .AN(n2653), .B(n2623), .Y(n2649) );
  CLKBUFX3 U2153 ( .A(n2644), .Y(n2458) );
  NOR2BXL U2154 ( .AN(n2648), .B(n2623), .Y(n2644) );
  CLKBUFX3 U2155 ( .A(n2639), .Y(n2457) );
  NOR2BXL U2156 ( .AN(n2643), .B(n2623), .Y(n2639) );
  CLKBUFX3 U2157 ( .A(n2634), .Y(n2456) );
  NOR2BXL U2158 ( .AN(n2638), .B(n2623), .Y(n2634) );
  CLKBUFX3 U2159 ( .A(n2629), .Y(n2455) );
  NOR2BXL U2160 ( .AN(n2433), .B(n2623), .Y(n2629) );
  CLKBUFX3 U2161 ( .A(n2624), .Y(n2454) );
  NOR2BXL U2162 ( .AN(n2628), .B(n2623), .Y(n2624) );
  CLKBUFX3 U2163 ( .A(n2614), .Y(n2453) );
  NOR2BXL U2164 ( .AN(n2622), .B(n2623), .Y(n2614) );
  CLKBUFX3 U2165 ( .A(n2707), .Y(n2482) );
  NOR2BX1 U2166 ( .AN(n2648), .B(n2693), .Y(n2707) );
  CLKBUFX3 U2167 ( .A(n2704), .Y(n2481) );
  NOR2BX1 U2168 ( .AN(n2643), .B(n2693), .Y(n2704) );
  CLKBUFX3 U2169 ( .A(n2702), .Y(n2480) );
  NOR2BX1 U2170 ( .AN(n2638), .B(n2693), .Y(n2702) );
  CLKBUFX3 U2171 ( .A(n2699), .Y(n2479) );
  CLKBUFX3 U2172 ( .A(n2697), .Y(n2478) );
  NOR2BX1 U2173 ( .AN(n2628), .B(n2693), .Y(n2697) );
  CLKBUFX3 U2174 ( .A(n2695), .Y(n2477) );
  NOR2BX1 U2175 ( .AN(n2622), .B(n2693), .Y(n2695) );
  CLKBUFX3 U2176 ( .A(n2671), .Y(n2467) );
  NOR2BX1 U2177 ( .AN(n2653), .B(n2658), .Y(n2671) );
  CLKBUFX3 U2178 ( .A(n2669), .Y(n2466) );
  NOR2BX1 U2179 ( .AN(n2648), .B(n2658), .Y(n2669) );
  CLKBUFX3 U2180 ( .A(n2667), .Y(n2465) );
  NOR2BX1 U2181 ( .AN(n2643), .B(n2658), .Y(n2667) );
  CLKBUFX3 U2182 ( .A(n2665), .Y(n2464) );
  NOR2BX1 U2183 ( .AN(n2638), .B(n2658), .Y(n2665) );
  CLKBUFX3 U2184 ( .A(n2663), .Y(n2463) );
  CLKBUFX3 U2185 ( .A(n2661), .Y(n2462) );
  NOR2BX1 U2186 ( .AN(n2628), .B(n2658), .Y(n2661) );
  CLKBUFX3 U2187 ( .A(n2659), .Y(n2461) );
  NOR2BX1 U2188 ( .AN(n2622), .B(n2658), .Y(n2659) );
  CLKBUFX3 U2189 ( .A(n2689), .Y(n2475) );
  NOR2BX1 U2190 ( .AN(n2653), .B(n2675), .Y(n2689) );
  CLKBUFX3 U2191 ( .A(n2687), .Y(n2474) );
  NOR2BX1 U2192 ( .AN(n2648), .B(n2675), .Y(n2687) );
  CLKBUFX3 U2193 ( .A(n2685), .Y(n2473) );
  NOR2BX1 U2194 ( .AN(n2643), .B(n2675), .Y(n2685) );
  CLKBUFX3 U2195 ( .A(n2683), .Y(n2472) );
  NOR2BX1 U2196 ( .AN(n2638), .B(n2675), .Y(n2683) );
  CLKBUFX3 U2197 ( .A(n2681), .Y(n2471) );
  CLKBUFX3 U2198 ( .A(n2679), .Y(n2470) );
  NOR2BX1 U2199 ( .AN(n2628), .B(n2675), .Y(n2679) );
  CLKBUFX3 U2200 ( .A(n2677), .Y(n2469) );
  NOR2BX1 U2201 ( .AN(n2622), .B(n2675), .Y(n2677) );
  NAND3X2 U2202 ( .A(n2701), .B(n2706), .C(N540), .Y(n2652) );
  OR2X2 U2203 ( .A(n2693), .B(n2652), .Y(n2714) );
  CLKBUFX3 U2204 ( .A(n2691), .Y(n2476) );
  OAI22XL U2205 ( .A0(n2657), .A1(n2693), .B0(n2652), .B1(n2675), .Y(n2691) );
  CLKBUFX3 U2206 ( .A(n2673), .Y(n2468) );
  OAI22XL U2207 ( .A0(n2657), .A1(n2675), .B0(n2652), .B1(n2658), .Y(n2673) );
  CLKBUFX3 U2208 ( .A(n2504), .Y(n2503) );
  CLKBUFX3 U2209 ( .A(n2446), .Y(n2504) );
  CLKBUFX3 U2210 ( .A(n2351), .Y(n2513) );
  CLKBUFX3 U2211 ( .A(n2445), .Y(n2506) );
  INVX3 U2212 ( .A(n2591), .Y(n2590) );
  INVX3 U2213 ( .A(n2579), .Y(n2576) );
  INVX3 U2214 ( .A(n2579), .Y(n2575) );
  CLKBUFX3 U2215 ( .A(n2526), .Y(n2573) );
  CLKBUFX3 U2216 ( .A(n2526), .Y(n2572) );
  CLKBUFX3 U2217 ( .A(n2574), .Y(n2567) );
  CLKBUFX3 U2218 ( .A(n2526), .Y(n2574) );
  MXI2X1 U2219 ( .A(n3292), .B(n3303), .S0(n3780), .Y(n3302) );
  ADDFXL U2220 ( .A(match_index_ns[1]), .B(count_pat[1]), .CI(\r761/carry [1]), 
        .CO(\r761/carry [2]), .S(N283) );
  OAI32X1 U2221 ( .A0(n2610), .A1(string_length[2]), .A2(n2603), .B0(
        string_length[3]), .B1(n2611), .Y(n2606) );
  OAI222XL U2222 ( .A0(n2607), .A1(n2606), .B0(N217), .B1(n2387), .C0(n2606), 
        .C1(n2605), .Y(n2609) );
  NOR2X2 U2223 ( .A(n2598), .B(count_pat[3]), .Y(N212) );
  NAND2X1 U2224 ( .A(n3778), .B(N220), .Y(n3243) );
  ADDFXL U2225 ( .A(match_index_ns[2]), .B(count_pat[2]), .CI(\r761/carry [2]), 
        .CO(\r761/carry [3]), .S(N284) );
  ADDFXL U2226 ( .A(match_index_ns[3]), .B(count_pat[3]), .CI(\r761/carry [3]), 
        .CO(\r761/carry [4]), .S(N285) );
  AND4X1 U2227 ( .A(n2083), .B(n2082), .C(n2081), .D(n3520), .Y(n2450) );
  CLKINVX1 U2228 ( .A(chardata[4]), .Y(n2588) );
  CLKINVX1 U2229 ( .A(chardata[6]), .Y(n2596) );
  CLKBUFX3 U2230 ( .A(n2619), .Y(n2494) );
  CLKBUFX3 U2231 ( .A(n2618), .Y(n2492) );
  CLKBUFX3 U2232 ( .A(ispattern), .Y(n2578) );
  OAI2BB1X1 U2233 ( .A0N(n2451), .A1N(n2578), .B0(n2613), .Y(n2349) );
  CLKBUFX3 U2234 ( .A(n2616), .Y(n2488) );
  NAND2X4 U2235 ( .A(star_index[3]), .B(star_index[4]), .Y(n2990) );
  CLKBUFX3 U2236 ( .A(ispattern), .Y(n2579) );
  ADDHXL U2237 ( .A(str_index[1]), .B(str_index[0]), .CO(\add_315/carry [2]), 
        .S(N541) );
  ADDHXL U2238 ( .A(str_index[2]), .B(\add_315/carry [2]), .CO(
        \add_315/carry [3]), .S(N542) );
  ADDHXL U2239 ( .A(str_index[3]), .B(\add_315/carry [3]), .CO(
        \add_315/carry [4]), .S(N543) );
  CLKBUFX3 U2240 ( .A(n3792), .Y(n2526) );
  NOR2X2 U2241 ( .A(n3317), .B(n3275), .Y(n3283) );
  OAI22X1 U2242 ( .A0(n2076), .A1(n2515), .B0(n3433), .B1(n1341), .Y(n3224) );
  XOR2X1 U2243 ( .A(match_index_ns[4]), .B(\r761/carry [4]), .Y(N286) );
  AND2X1 U2244 ( .A(\gt_100/A[0] ), .B(count_pat[0]), .Y(\r761/carry [1]) );
  XOR2X1 U2245 ( .A(count_pat[0]), .B(\gt_100/A[0] ), .Y(N282) );
  OAI2BB1X1 U2246 ( .A0N(count_pat[0]), .A1N(count_pat[1]), .B0(n2597), .Y(
        N209) );
  AO21X1 U2247 ( .A0(n2598), .A1(count_pat[3]), .B0(N212), .Y(N211) );
  CLKINVX1 U2248 ( .A(N282), .Y(N287) );
  NOR2X1 U2249 ( .A(N283), .B(N282), .Y(n2599) );
  NAND2X1 U2250 ( .A(n2599), .B(n2602), .Y(n2600) );
  OAI21XL U2251 ( .A0(n2599), .A1(n2602), .B0(n2600), .Y(N289) );
  XNOR2X1 U2252 ( .A(N285), .B(n2600), .Y(N290) );
  NOR2X1 U2253 ( .A(N285), .B(n2600), .Y(n2601) );
  XOR2X1 U2254 ( .A(N286), .B(n2601), .Y(N291) );
  XOR2X1 U2255 ( .A(\add_315/carry [4]), .B(str_index[4]), .Y(N544) );
  AOI21X1 U2256 ( .A0(string_length[2]), .A1(n2610), .B0(n2603), .Y(n2607) );
  AOI2BB1X1 U2257 ( .A0N(n2386), .A1N(N214), .B0(string_length[0]), .Y(n2604)
         );
  AO22X1 U2258 ( .A0(n2604), .A1(N213), .B0(N214), .B1(n2386), .Y(n2605) );
  NOR2X1 U2259 ( .A(N219), .B(N218), .Y(n2608) );
  OAI211X1 U2260 ( .A0(string_length[4]), .A1(n2612), .B0(n2609), .C0(n2608), 
        .Y(N220) );
  OAI22XL U2261 ( .A0(n3777), .A1(n2453), .B0(n2615), .B1(n2616), .Y(n2348) );
  OAI22XL U2262 ( .A0(n3776), .A1(n2453), .B0(n2615), .B1(n2595), .Y(n2347) );
  MXI2X1 U2263 ( .A(n3775), .B(n2617), .S0(n2453), .Y(n2346) );
  OAI22XL U2264 ( .A0(n3559), .A1(n2453), .B0(n2615), .B1(n2587), .Y(n2345) );
  OAI22XL U2265 ( .A0(n3678), .A1(n2453), .B0(n2615), .B1(n2492), .Y(n2344) );
  OAI22XL U2266 ( .A0(n3680), .A1(n2453), .B0(n2494), .B1(n2615), .Y(n2343) );
  OAI22XL U2267 ( .A0(n3681), .A1(n2453), .B0(n2615), .B1(n2582), .Y(n2342) );
  OAI22XL U2268 ( .A0(n3679), .A1(n2453), .B0(n2615), .B1(n2496), .Y(n2341) );
  NAND2X1 U2269 ( .A(n2453), .B(n2621), .Y(n2615) );
  OAI22XL U2270 ( .A0(n3774), .A1(n2454), .B0(n2491), .B1(n2625), .Y(n2340) );
  OAI22XL U2271 ( .A0(n3773), .A1(n2454), .B0(n2595), .B1(n2625), .Y(n2339) );
  MXI2X1 U2272 ( .A(n3772), .B(n2626), .S0(n2454), .Y(n2338) );
  OAI22XL U2273 ( .A0(n3558), .A1(n2454), .B0(n2588), .B1(n2625), .Y(n2337) );
  OAI22XL U2274 ( .A0(n3560), .A1(n2454), .B0(n2493), .B1(n2625), .Y(n2336) );
  OAI22XL U2275 ( .A0(n3562), .A1(n2454), .B0(n2495), .B1(n2625), .Y(n2335) );
  OAI22XL U2276 ( .A0(n3563), .A1(n2454), .B0(n2582), .B1(n2625), .Y(n2334) );
  OAI22XL U2277 ( .A0(n3561), .A1(n2454), .B0(n2496), .B1(n2625), .Y(n2333) );
  NAND2X1 U2278 ( .A(n2454), .B(n2627), .Y(n2625) );
  OAI22XL U2279 ( .A0(n3771), .A1(n2455), .B0(n2491), .B1(n2630), .Y(n2332) );
  OAI22XL U2280 ( .A0(n3770), .A1(n2455), .B0(n2594), .B1(n2630), .Y(n2331) );
  MXI2X1 U2281 ( .A(n3769), .B(n2631), .S0(n2455), .Y(n2330) );
  OAI22XL U2282 ( .A0(n3557), .A1(n2455), .B0(n2588), .B1(n2630), .Y(n2329) );
  OAI22XL U2283 ( .A0(n3564), .A1(n2455), .B0(n2493), .B1(n2630), .Y(n2328) );
  OAI22XL U2284 ( .A0(n3566), .A1(n2455), .B0(n2495), .B1(n2630), .Y(n2327) );
  OAI22XL U2285 ( .A0(n3567), .A1(n2455), .B0(n2582), .B1(n2630), .Y(n2326) );
  OAI22XL U2286 ( .A0(n3565), .A1(n2455), .B0(n2496), .B1(n2630), .Y(n2325) );
  NAND2X1 U2287 ( .A(n2455), .B(n2632), .Y(n2630) );
  OAI22XL U2288 ( .A0(n3768), .A1(n2456), .B0(n2491), .B1(n2635), .Y(n2324) );
  OAI22XL U2289 ( .A0(n3767), .A1(n2456), .B0(n2594), .B1(n2635), .Y(n2323) );
  MXI2X1 U2290 ( .A(n3766), .B(n2636), .S0(n2456), .Y(n2322) );
  OAI22XL U2291 ( .A0(n3556), .A1(n2456), .B0(n2588), .B1(n2635), .Y(n2321) );
  OAI22XL U2292 ( .A0(n3568), .A1(n2456), .B0(n2493), .B1(n2635), .Y(n2320) );
  OAI22XL U2293 ( .A0(n3570), .A1(n2456), .B0(n2495), .B1(n2635), .Y(n2319) );
  OAI22XL U2294 ( .A0(n3571), .A1(n2456), .B0(n2582), .B1(n2635), .Y(n2318) );
  OAI22XL U2295 ( .A0(n3569), .A1(n2456), .B0(n2496), .B1(n2635), .Y(n2317) );
  NAND2X1 U2296 ( .A(n2456), .B(n2637), .Y(n2635) );
  OAI22XL U2297 ( .A0(n3765), .A1(n2457), .B0(n2491), .B1(n2640), .Y(n2316) );
  OAI22XL U2298 ( .A0(n3764), .A1(n2457), .B0(n2594), .B1(n2640), .Y(n2315) );
  MXI2X1 U2299 ( .A(n3763), .B(n2641), .S0(n2457), .Y(n2314) );
  OAI22XL U2300 ( .A0(n3555), .A1(n2457), .B0(n2588), .B1(n2640), .Y(n2313) );
  OAI22XL U2301 ( .A0(n3572), .A1(n2457), .B0(n2493), .B1(n2640), .Y(n2312) );
  OAI22XL U2302 ( .A0(n3574), .A1(n2457), .B0(n2495), .B1(n2640), .Y(n2311) );
  OAI22XL U2303 ( .A0(n3575), .A1(n2457), .B0(n2582), .B1(n2640), .Y(n2310) );
  OAI22XL U2304 ( .A0(n3573), .A1(n2457), .B0(n2496), .B1(n2640), .Y(n2309) );
  NAND2X1 U2305 ( .A(n2457), .B(n2642), .Y(n2640) );
  OAI22XL U2306 ( .A0(n3762), .A1(n2458), .B0(n2491), .B1(n2645), .Y(n2308) );
  OAI22XL U2307 ( .A0(n3761), .A1(n2458), .B0(n2594), .B1(n2645), .Y(n2307) );
  MXI2X1 U2308 ( .A(n3760), .B(n2646), .S0(n2458), .Y(n2306) );
  OAI22XL U2309 ( .A0(n3554), .A1(n2458), .B0(n2588), .B1(n2645), .Y(n2305) );
  OAI22XL U2310 ( .A0(n3576), .A1(n2458), .B0(n2493), .B1(n2645), .Y(n2304) );
  OAI22XL U2311 ( .A0(n3578), .A1(n2458), .B0(n2495), .B1(n2645), .Y(n2303) );
  OAI22XL U2312 ( .A0(n3579), .A1(n2458), .B0(n2582), .B1(n2645), .Y(n2302) );
  OAI22XL U2313 ( .A0(n3577), .A1(n2458), .B0(n2496), .B1(n2645), .Y(n2301) );
  NAND2X1 U2314 ( .A(n2458), .B(n2647), .Y(n2645) );
  OAI22XL U2315 ( .A0(n3759), .A1(n2459), .B0(n2491), .B1(n2650), .Y(n2300) );
  OAI22XL U2316 ( .A0(n3758), .A1(n2459), .B0(n2594), .B1(n2650), .Y(n2299) );
  MXI2X1 U2317 ( .A(n3757), .B(n2651), .S0(n2459), .Y(n2298) );
  OAI22XL U2318 ( .A0(n3553), .A1(n2459), .B0(n2586), .B1(n2650), .Y(n2297) );
  OAI22XL U2319 ( .A0(n3580), .A1(n2459), .B0(n2493), .B1(n2650), .Y(n2296) );
  OAI22XL U2320 ( .A0(n3582), .A1(n2459), .B0(n2495), .B1(n2650), .Y(n2295) );
  OAI22XL U2321 ( .A0(n3583), .A1(n2459), .B0(n2582), .B1(n2650), .Y(n2294) );
  OAI22XL U2322 ( .A0(n3581), .A1(n2459), .B0(n2496), .B1(n2650), .Y(n2293) );
  NAND2X1 U2323 ( .A(n2459), .B(n2652), .Y(n2650) );
  OAI22XL U2324 ( .A0(n3756), .A1(n2460), .B0(n2491), .B1(n2655), .Y(n2292) );
  OAI22XL U2325 ( .A0(n3755), .A1(n2460), .B0(n2594), .B1(n2655), .Y(n2291) );
  MXI2X1 U2326 ( .A(n3754), .B(n2656), .S0(n2460), .Y(n2290) );
  OAI22XL U2327 ( .A0(n3552), .A1(n2460), .B0(n2586), .B1(n2655), .Y(n2289) );
  OAI22XL U2328 ( .A0(n3584), .A1(n2460), .B0(n2493), .B1(n2655), .Y(n2288) );
  OAI22XL U2329 ( .A0(n3586), .A1(n2460), .B0(n2495), .B1(n2655), .Y(n2287) );
  OAI22XL U2330 ( .A0(n3587), .A1(n2460), .B0(n2582), .B1(n2655), .Y(n2286) );
  OAI22XL U2331 ( .A0(n3585), .A1(n2460), .B0(n2496), .B1(n2655), .Y(n2285) );
  NAND2X1 U2332 ( .A(n2657), .B(n2460), .Y(n2655) );
  OAI22XL U2333 ( .A0(n3753), .A1(n2461), .B0(n2489), .B1(n2660), .Y(n2284) );
  OAI22XL U2334 ( .A0(n3752), .A1(n2461), .B0(n2594), .B1(n2660), .Y(n2283) );
  MXI2X1 U2335 ( .A(n3751), .B(n2617), .S0(n2461), .Y(n2282) );
  OAI22XL U2336 ( .A0(n3551), .A1(n2461), .B0(n2586), .B1(n2660), .Y(n2281) );
  OAI22XL U2337 ( .A0(n3588), .A1(n2461), .B0(n2492), .B1(n2660), .Y(n2280) );
  OAI22XL U2338 ( .A0(n3590), .A1(n2461), .B0(n2495), .B1(n2660), .Y(n2279) );
  OAI22XL U2339 ( .A0(n3591), .A1(n2461), .B0(n2582), .B1(n2660), .Y(n2278) );
  OAI22XL U2340 ( .A0(n3589), .A1(n2461), .B0(n2496), .B1(n2660), .Y(n2277) );
  NAND2X1 U2341 ( .A(n2461), .B(n2621), .Y(n2660) );
  OAI22XL U2342 ( .A0(n3750), .A1(n2462), .B0(n2491), .B1(n2662), .Y(n2276) );
  OAI22XL U2343 ( .A0(n3749), .A1(n2462), .B0(n2594), .B1(n2662), .Y(n2275) );
  MXI2X1 U2344 ( .A(n3748), .B(n2626), .S0(n2462), .Y(n2274) );
  OAI22XL U2345 ( .A0(n3550), .A1(n2462), .B0(n2586), .B1(n2662), .Y(n2273) );
  OAI22XL U2346 ( .A0(n3592), .A1(n2462), .B0(n2493), .B1(n2662), .Y(n2272) );
  OAI22XL U2347 ( .A0(n3594), .A1(n2462), .B0(n2494), .B1(n2662), .Y(n2271) );
  OAI22XL U2348 ( .A0(n3595), .A1(n2462), .B0(n2581), .B1(n2662), .Y(n2270) );
  OAI22XL U2349 ( .A0(n3593), .A1(n2462), .B0(n2496), .B1(n2662), .Y(n2269) );
  NAND2X1 U2350 ( .A(n2462), .B(n2627), .Y(n2662) );
  OAI22XL U2351 ( .A0(n3747), .A1(n2463), .B0(n2488), .B1(n2664), .Y(n2268) );
  OAI22XL U2352 ( .A0(n3746), .A1(n2463), .B0(n2595), .B1(n2664), .Y(n2267) );
  MXI2X1 U2353 ( .A(n3745), .B(n2631), .S0(n2463), .Y(n2266) );
  OAI22XL U2354 ( .A0(n3549), .A1(n2463), .B0(n2586), .B1(n2664), .Y(n2265) );
  OAI22XL U2355 ( .A0(n3596), .A1(n2463), .B0(n2493), .B1(n2664), .Y(n2264) );
  OAI22XL U2356 ( .A0(n3598), .A1(n2463), .B0(n2494), .B1(n2664), .Y(n2263) );
  OAI22XL U2357 ( .A0(n3599), .A1(n2463), .B0(n2582), .B1(n2664), .Y(n2262) );
  OAI22XL U2358 ( .A0(n3597), .A1(n2463), .B0(n2496), .B1(n2664), .Y(n2261) );
  NAND2X1 U2359 ( .A(n2463), .B(n2632), .Y(n2664) );
  OAI22XL U2360 ( .A0(n3744), .A1(n2464), .B0(n2491), .B1(n2666), .Y(n2260) );
  OAI22XL U2361 ( .A0(n3743), .A1(n2464), .B0(n2594), .B1(n2666), .Y(n2259) );
  MXI2X1 U2362 ( .A(n3742), .B(n2636), .S0(n2464), .Y(n2258) );
  OAI22XL U2363 ( .A0(n3548), .A1(n2464), .B0(n2586), .B1(n2666), .Y(n2257) );
  OAI22XL U2364 ( .A0(n3600), .A1(n2464), .B0(n2492), .B1(n2666), .Y(n2256) );
  OAI22XL U2365 ( .A0(n3602), .A1(n2464), .B0(n2494), .B1(n2666), .Y(n2255) );
  OAI22XL U2366 ( .A0(n3603), .A1(n2464), .B0(n2582), .B1(n2666), .Y(n2254) );
  OAI22XL U2367 ( .A0(n3601), .A1(n2464), .B0(n2496), .B1(n2666), .Y(n2253) );
  NAND2X1 U2368 ( .A(n2464), .B(n2637), .Y(n2666) );
  OAI22XL U2369 ( .A0(n3741), .A1(n2465), .B0(n2491), .B1(n2668), .Y(n2252) );
  OAI22XL U2370 ( .A0(n3740), .A1(n2465), .B0(n2594), .B1(n2668), .Y(n2251) );
  MXI2X1 U2371 ( .A(n3739), .B(n2641), .S0(n2465), .Y(n2250) );
  OAI22XL U2372 ( .A0(n3547), .A1(n2465), .B0(n2586), .B1(n2668), .Y(n2249) );
  OAI22XL U2373 ( .A0(n3604), .A1(n2465), .B0(n2492), .B1(n2668), .Y(n2248) );
  OAI22XL U2374 ( .A0(n3606), .A1(n2465), .B0(n2494), .B1(n2668), .Y(n2247) );
  OAI22XL U2375 ( .A0(n3607), .A1(n2465), .B0(n2582), .B1(n2668), .Y(n2246) );
  OAI22XL U2376 ( .A0(n3605), .A1(n2465), .B0(n2496), .B1(n2668), .Y(n2245) );
  NAND2X1 U2377 ( .A(n2465), .B(n2642), .Y(n2668) );
  OAI22XL U2378 ( .A0(n3738), .A1(n2466), .B0(n2491), .B1(n2670), .Y(n2244) );
  OAI22XL U2379 ( .A0(n3737), .A1(n2466), .B0(n2594), .B1(n2670), .Y(n2243) );
  MXI2X1 U2380 ( .A(n3736), .B(n2646), .S0(n2466), .Y(n2242) );
  OAI22XL U2381 ( .A0(n3546), .A1(n2466), .B0(n2586), .B1(n2670), .Y(n2241) );
  OAI22XL U2382 ( .A0(n3608), .A1(n2466), .B0(n2492), .B1(n2670), .Y(n2240) );
  OAI22XL U2383 ( .A0(n3610), .A1(n2466), .B0(n2494), .B1(n2670), .Y(n2239) );
  OAI22XL U2384 ( .A0(n3611), .A1(n2466), .B0(n2581), .B1(n2670), .Y(n2238) );
  OAI22XL U2385 ( .A0(n3609), .A1(n2466), .B0(n2496), .B1(n2670), .Y(n2237) );
  NAND2X1 U2386 ( .A(n2466), .B(n2647), .Y(n2670) );
  OAI22XL U2387 ( .A0(n3735), .A1(n2467), .B0(n2491), .B1(n2672), .Y(n2236) );
  OAI22XL U2388 ( .A0(n3734), .A1(n2467), .B0(n2594), .B1(n2672), .Y(n2235) );
  MXI2X1 U2389 ( .A(n3733), .B(n2651), .S0(n2467), .Y(n2234) );
  OAI22XL U2390 ( .A0(n3545), .A1(n2467), .B0(n2586), .B1(n2672), .Y(n2233) );
  OAI22XL U2391 ( .A0(n3612), .A1(n2467), .B0(n2492), .B1(n2672), .Y(n2232) );
  OAI22XL U2392 ( .A0(n3614), .A1(n2467), .B0(n2494), .B1(n2672), .Y(n2231) );
  OAI22XL U2393 ( .A0(n3615), .A1(n2467), .B0(n2583), .B1(n2672), .Y(n2230) );
  OAI22XL U2394 ( .A0(n3613), .A1(n2467), .B0(n2496), .B1(n2672), .Y(n2229) );
  NAND2X1 U2395 ( .A(n2467), .B(n2652), .Y(n2672) );
  OAI22XL U2396 ( .A0(n3732), .A1(n2468), .B0(n2491), .B1(n2674), .Y(n2228) );
  OAI22XL U2397 ( .A0(n3731), .A1(n2468), .B0(n2594), .B1(n2674), .Y(n2227) );
  MXI2X1 U2398 ( .A(n3730), .B(n2656), .S0(n2468), .Y(n2226) );
  OAI22XL U2399 ( .A0(n3544), .A1(n2468), .B0(n2587), .B1(n2674), .Y(n2225) );
  OAI22XL U2400 ( .A0(n3616), .A1(n2468), .B0(n2492), .B1(n2674), .Y(n2224) );
  OAI22XL U2401 ( .A0(n3618), .A1(n2468), .B0(n2494), .B1(n2674), .Y(n2223) );
  OAI22XL U2402 ( .A0(n3619), .A1(n2468), .B0(n2583), .B1(n2674), .Y(n2222) );
  OAI22XL U2403 ( .A0(n3617), .A1(n2468), .B0(n2496), .B1(n2674), .Y(n2221) );
  NAND2X1 U2404 ( .A(n2657), .B(n2468), .Y(n2674) );
  OAI22XL U2405 ( .A0(n3729), .A1(n2469), .B0(n2491), .B1(n2678), .Y(n2220) );
  OAI22XL U2406 ( .A0(n3728), .A1(n2469), .B0(n2595), .B1(n2678), .Y(n2219) );
  MXI2X1 U2407 ( .A(n3727), .B(n2617), .S0(n2469), .Y(n2218) );
  OAI22XL U2408 ( .A0(n3543), .A1(n2469), .B0(n2587), .B1(n2678), .Y(n2217) );
  OAI22XL U2409 ( .A0(n3620), .A1(n2469), .B0(n2492), .B1(n2678), .Y(n2216) );
  OAI22XL U2410 ( .A0(n3622), .A1(n2469), .B0(n2494), .B1(n2678), .Y(n2215) );
  OAI22XL U2411 ( .A0(n3623), .A1(n2469), .B0(n2583), .B1(n2678), .Y(n2214) );
  OAI22XL U2412 ( .A0(n3621), .A1(n2469), .B0(n2496), .B1(n2678), .Y(n2213) );
  NAND2X1 U2413 ( .A(n2469), .B(n2621), .Y(n2678) );
  OAI22XL U2414 ( .A0(n3726), .A1(n2470), .B0(n2491), .B1(n2680), .Y(n2212) );
  OAI22XL U2415 ( .A0(n3725), .A1(n2470), .B0(n2595), .B1(n2680), .Y(n2211) );
  MXI2X1 U2416 ( .A(n3724), .B(n2626), .S0(n2470), .Y(n2210) );
  OAI22XL U2417 ( .A0(n3542), .A1(n2470), .B0(n2587), .B1(n2680), .Y(n2209) );
  OAI22XL U2418 ( .A0(n3624), .A1(n2470), .B0(n2492), .B1(n2680), .Y(n2208) );
  OAI22XL U2419 ( .A0(n3626), .A1(n2470), .B0(n2494), .B1(n2680), .Y(n2207) );
  OAI22XL U2420 ( .A0(n3627), .A1(n2470), .B0(n2583), .B1(n2680), .Y(n2206) );
  OAI22XL U2421 ( .A0(n3625), .A1(n2470), .B0(n2496), .B1(n2680), .Y(n2205) );
  NAND2X1 U2422 ( .A(n2470), .B(n2627), .Y(n2680) );
  OAI22XL U2423 ( .A0(n3723), .A1(n2471), .B0(n2491), .B1(n2682), .Y(n2204) );
  OAI22XL U2424 ( .A0(n3722), .A1(n2471), .B0(n2595), .B1(n2682), .Y(n2203) );
  MXI2X1 U2425 ( .A(n3721), .B(n2631), .S0(n2471), .Y(n2202) );
  OAI22XL U2426 ( .A0(n3541), .A1(n2471), .B0(n2587), .B1(n2682), .Y(n2201) );
  OAI22XL U2427 ( .A0(n3628), .A1(n2471), .B0(n2492), .B1(n2682), .Y(n2200) );
  OAI22XL U2428 ( .A0(n3630), .A1(n2471), .B0(n2494), .B1(n2682), .Y(n2199) );
  OAI22XL U2429 ( .A0(n3631), .A1(n2471), .B0(n2583), .B1(n2682), .Y(n2198) );
  OAI22XL U2430 ( .A0(n3629), .A1(n2471), .B0(n2496), .B1(n2682), .Y(n2197) );
  NAND2X1 U2431 ( .A(n2471), .B(n2632), .Y(n2682) );
  OAI22XL U2432 ( .A0(n3720), .A1(n2472), .B0(n2491), .B1(n2684), .Y(n2196) );
  OAI22XL U2433 ( .A0(n3719), .A1(n2472), .B0(n2596), .B1(n2684), .Y(n2195) );
  MXI2X1 U2434 ( .A(n3718), .B(n2636), .S0(n2472), .Y(n2194) );
  OAI22XL U2435 ( .A0(n3540), .A1(n2472), .B0(n2587), .B1(n2684), .Y(n2193) );
  OAI22XL U2436 ( .A0(n3632), .A1(n2472), .B0(n2492), .B1(n2684), .Y(n2192) );
  OAI22XL U2437 ( .A0(n3634), .A1(n2472), .B0(n2494), .B1(n2684), .Y(n2191) );
  OAI22XL U2438 ( .A0(n3635), .A1(n2472), .B0(n2581), .B1(n2684), .Y(n2190) );
  OAI22XL U2439 ( .A0(n3633), .A1(n2472), .B0(n2496), .B1(n2684), .Y(n2189) );
  NAND2X1 U2440 ( .A(n2472), .B(n2637), .Y(n2684) );
  OAI22XL U2441 ( .A0(n3717), .A1(n2473), .B0(n2491), .B1(n2686), .Y(n2188) );
  OAI22XL U2442 ( .A0(n3716), .A1(n2473), .B0(n2596), .B1(n2686), .Y(n2187) );
  MXI2X1 U2443 ( .A(n3715), .B(n2641), .S0(n2473), .Y(n2186) );
  OAI22XL U2444 ( .A0(n3539), .A1(n2473), .B0(n2587), .B1(n2686), .Y(n2185) );
  OAI22XL U2445 ( .A0(n3636), .A1(n2473), .B0(n2618), .B1(n2686), .Y(n2184) );
  OAI22XL U2446 ( .A0(n3638), .A1(n2473), .B0(n2619), .B1(n2686), .Y(n2183) );
  OAI22XL U2447 ( .A0(n3639), .A1(n2473), .B0(n2581), .B1(n2686), .Y(n2182) );
  OAI22XL U2448 ( .A0(n3637), .A1(n2473), .B0(n2496), .B1(n2686), .Y(n2181) );
  NAND2X1 U2449 ( .A(n2473), .B(n2642), .Y(n2686) );
  OAI22XL U2450 ( .A0(n3714), .A1(n2474), .B0(n2491), .B1(n2688), .Y(n2180) );
  OAI22XL U2451 ( .A0(n3713), .A1(n2474), .B0(n2596), .B1(n2688), .Y(n2179) );
  MXI2X1 U2452 ( .A(n3712), .B(n2646), .S0(n2474), .Y(n2178) );
  OAI22XL U2453 ( .A0(n3538), .A1(n2474), .B0(n2587), .B1(n2688), .Y(n2177) );
  OAI22XL U2454 ( .A0(n3640), .A1(n2474), .B0(n2618), .B1(n2688), .Y(n2176) );
  OAI22XL U2455 ( .A0(n3642), .A1(n2474), .B0(n2619), .B1(n2688), .Y(n2175) );
  OAI22XL U2456 ( .A0(n3643), .A1(n2474), .B0(n2581), .B1(n2688), .Y(n2174) );
  OAI22XL U2457 ( .A0(n3641), .A1(n2474), .B0(n2497), .B1(n2688), .Y(n2173) );
  NAND2X1 U2458 ( .A(n2474), .B(n2647), .Y(n2688) );
  OAI22XL U2459 ( .A0(n3711), .A1(n2475), .B0(n2491), .B1(n2690), .Y(n2172) );
  OAI22XL U2460 ( .A0(n3710), .A1(n2475), .B0(n2596), .B1(n2690), .Y(n2171) );
  MXI2X1 U2461 ( .A(n3709), .B(n2651), .S0(n2475), .Y(n2170) );
  OAI22XL U2462 ( .A0(n3537), .A1(n2475), .B0(n2586), .B1(n2690), .Y(n2169) );
  OAI22XL U2463 ( .A0(n3644), .A1(n2475), .B0(n2618), .B1(n2690), .Y(n2168) );
  OAI22XL U2464 ( .A0(n3646), .A1(n2475), .B0(n2619), .B1(n2690), .Y(n2167) );
  OAI22XL U2465 ( .A0(n3647), .A1(n2475), .B0(n2581), .B1(n2690), .Y(n2166) );
  OAI22XL U2466 ( .A0(n3645), .A1(n2475), .B0(n2497), .B1(n2690), .Y(n2165) );
  NAND2X1 U2467 ( .A(n2475), .B(n2652), .Y(n2690) );
  OAI22XL U2468 ( .A0(n3708), .A1(n2476), .B0(n2491), .B1(n2692), .Y(n2164) );
  OAI22XL U2469 ( .A0(n3707), .A1(n2476), .B0(n2596), .B1(n2692), .Y(n2163) );
  MXI2X1 U2470 ( .A(n3706), .B(n2656), .S0(n2476), .Y(n2162) );
  NOR2BX1 U2471 ( .AN(n2657), .B(chardata[5]), .Y(n2656) );
  OAI22XL U2472 ( .A0(n3536), .A1(n2476), .B0(n2587), .B1(n2692), .Y(n2161) );
  OAI22XL U2473 ( .A0(n3648), .A1(n2476), .B0(n2618), .B1(n2692), .Y(n2160) );
  OAI22XL U2474 ( .A0(n3650), .A1(n2476), .B0(n2495), .B1(n2692), .Y(n2159) );
  OAI22XL U2475 ( .A0(n3651), .A1(n2476), .B0(n2581), .B1(n2692), .Y(n2158) );
  OAI22XL U2476 ( .A0(n3649), .A1(n2476), .B0(n2497), .B1(n2692), .Y(n2157) );
  NAND2X1 U2477 ( .A(n2657), .B(n2476), .Y(n2692) );
  OAI22XL U2478 ( .A0(n3705), .A1(n2477), .B0(n2490), .B1(n2696), .Y(n2156) );
  OAI22XL U2479 ( .A0(n3704), .A1(n2477), .B0(n2595), .B1(n2696), .Y(n2155) );
  MXI2X1 U2480 ( .A(n3703), .B(n2617), .S0(n2477), .Y(n2154) );
  NOR2BX1 U2481 ( .AN(n2621), .B(n2590), .Y(n2617) );
  OAI22XL U2482 ( .A0(n3535), .A1(n2477), .B0(n2587), .B1(n2696), .Y(n2153) );
  OAI22XL U2483 ( .A0(n3652), .A1(n2477), .B0(n2618), .B1(n2696), .Y(n2152) );
  OAI22XL U2484 ( .A0(n3654), .A1(n2477), .B0(n2619), .B1(n2696), .Y(n2151) );
  OAI22XL U2485 ( .A0(n3655), .A1(n2477), .B0(n2581), .B1(n2696), .Y(n2150) );
  OAI22XL U2486 ( .A0(n3653), .A1(n2477), .B0(n2497), .B1(n2696), .Y(n2149) );
  NAND2X1 U2487 ( .A(n2477), .B(n2621), .Y(n2696) );
  OAI22XL U2488 ( .A0(n3702), .A1(n2478), .B0(n2490), .B1(n2698), .Y(n2148) );
  OAI22XL U2489 ( .A0(n3701), .A1(n2478), .B0(n2595), .B1(n2698), .Y(n2147) );
  MXI2X1 U2490 ( .A(n3700), .B(n2626), .S0(n2478), .Y(n2146) );
  NOR2BX1 U2491 ( .AN(n2627), .B(chardata[5]), .Y(n2626) );
  OAI22XL U2492 ( .A0(n3534), .A1(n2478), .B0(n2586), .B1(n2698), .Y(n2145) );
  OAI22XL U2493 ( .A0(n3656), .A1(n2478), .B0(n2618), .B1(n2698), .Y(n2144) );
  OAI22XL U2494 ( .A0(n3658), .A1(n2478), .B0(n2619), .B1(n2698), .Y(n2143) );
  OAI22XL U2495 ( .A0(n3659), .A1(n2478), .B0(n2581), .B1(n2698), .Y(n2142) );
  OAI22XL U2496 ( .A0(n3657), .A1(n2478), .B0(n2497), .B1(n2698), .Y(n2141) );
  NAND2X1 U2497 ( .A(n2478), .B(n2627), .Y(n2698) );
  OAI22XL U2498 ( .A0(n3699), .A1(n2479), .B0(n2490), .B1(n2700), .Y(n2140) );
  OAI22XL U2499 ( .A0(n3698), .A1(n2479), .B0(n2594), .B1(n2700), .Y(n2139) );
  MXI2X1 U2500 ( .A(n3697), .B(n2631), .S0(n2479), .Y(n2138) );
  NOR2BX1 U2501 ( .AN(n2632), .B(chardata[5]), .Y(n2631) );
  OAI22XL U2502 ( .A0(n3533), .A1(n2479), .B0(n2587), .B1(n2700), .Y(n2137) );
  OAI22XL U2503 ( .A0(n3660), .A1(n2479), .B0(n2492), .B1(n2700), .Y(n2136) );
  OAI22XL U2504 ( .A0(n3662), .A1(n2479), .B0(n2619), .B1(n2700), .Y(n2135) );
  OAI22XL U2505 ( .A0(n3663), .A1(n2479), .B0(n2582), .B1(n2700), .Y(n2134) );
  OAI22XL U2506 ( .A0(n3661), .A1(n2479), .B0(n2497), .B1(n2700), .Y(n2133) );
  NAND2X1 U2507 ( .A(n2479), .B(n2632), .Y(n2700) );
  NAND3X1 U2508 ( .A(str_index[2]), .B(n2701), .C(str_index[0]), .Y(n2627) );
  OAI22XL U2509 ( .A0(n3696), .A1(n2480), .B0(n2490), .B1(n2703), .Y(n2132) );
  OAI22XL U2510 ( .A0(n3695), .A1(n2480), .B0(n2594), .B1(n2703), .Y(n2131) );
  MXI2X1 U2511 ( .A(n3694), .B(n2636), .S0(n2480), .Y(n2130) );
  NOR2BX1 U2512 ( .AN(n2637), .B(chardata[5]), .Y(n2636) );
  OAI22XL U2513 ( .A0(n3532), .A1(n2480), .B0(n2587), .B1(n2703), .Y(n2129) );
  OAI22XL U2514 ( .A0(n3664), .A1(n2480), .B0(n2492), .B1(n2703), .Y(n2128) );
  OAI22XL U2515 ( .A0(n3666), .A1(n2480), .B0(n2494), .B1(n2703), .Y(n2127) );
  OAI22XL U2516 ( .A0(n3667), .A1(n2480), .B0(n2582), .B1(n2703), .Y(n2126) );
  OAI22XL U2517 ( .A0(n3665), .A1(n2480), .B0(n2497), .B1(n2703), .Y(n2125) );
  NAND2X1 U2518 ( .A(n2480), .B(n2637), .Y(n2703) );
  OAI22XL U2519 ( .A0(n3693), .A1(n2481), .B0(n2490), .B1(n2705), .Y(n2124) );
  OAI22XL U2520 ( .A0(n3692), .A1(n2481), .B0(n2594), .B1(n2705), .Y(n2123) );
  MXI2X1 U2521 ( .A(n3691), .B(n2641), .S0(n2481), .Y(n2122) );
  NOR2BX1 U2522 ( .AN(n2642), .B(chardata[5]), .Y(n2641) );
  OAI22XL U2523 ( .A0(n3531), .A1(n2481), .B0(n2587), .B1(n2705), .Y(n2121) );
  OAI22XL U2524 ( .A0(n3668), .A1(n2481), .B0(n2493), .B1(n2705), .Y(n2120) );
  OAI22XL U2525 ( .A0(n3670), .A1(n2481), .B0(n2494), .B1(n2705), .Y(n2119) );
  OAI22XL U2526 ( .A0(n3671), .A1(n2481), .B0(n2582), .B1(n2705), .Y(n2118) );
  OAI22XL U2527 ( .A0(n3669), .A1(n2481), .B0(n2497), .B1(n2705), .Y(n2117) );
  NAND2X1 U2528 ( .A(n2481), .B(n2642), .Y(n2705) );
  OAI22XL U2529 ( .A0(n3690), .A1(n2482), .B0(n2490), .B1(n2708), .Y(n2116) );
  OAI22XL U2530 ( .A0(n3689), .A1(n2482), .B0(n2594), .B1(n2708), .Y(n2115) );
  MXI2X1 U2531 ( .A(n3688), .B(n2646), .S0(n2482), .Y(n2114) );
  NOR2BX1 U2532 ( .AN(n2647), .B(chardata[5]), .Y(n2646) );
  OAI22XL U2533 ( .A0(n3530), .A1(n2482), .B0(n2587), .B1(n2708), .Y(n2113) );
  OAI22XL U2534 ( .A0(n3672), .A1(n2482), .B0(n2492), .B1(n2708), .Y(n2112) );
  OAI22XL U2535 ( .A0(n3674), .A1(n2482), .B0(n2495), .B1(n2708), .Y(n2111) );
  OAI22XL U2536 ( .A0(n3675), .A1(n2482), .B0(n2582), .B1(n2708), .Y(n2110) );
  OAI22XL U2537 ( .A0(n3673), .A1(n2482), .B0(n2497), .B1(n2708), .Y(n2109) );
  NAND2X1 U2538 ( .A(n2482), .B(n2647), .Y(n2708) );
  OAI22XL U2539 ( .A0(n3687), .A1(n2483), .B0(n2490), .B1(n2710), .Y(n2108) );
  OAI22XL U2540 ( .A0(n3686), .A1(n2483), .B0(n2595), .B1(n2710), .Y(n2107) );
  MXI2X1 U2541 ( .A(n2711), .B(n2651), .S0(n2483), .Y(n2106) );
  AND2X1 U2542 ( .A(n2652), .B(n2591), .Y(n2651) );
  OAI22XL U2543 ( .A0(n3677), .A1(n2483), .B0(n2587), .B1(n2710), .Y(n2105) );
  OAI22XL U2544 ( .A0(n2483), .A1(n2712), .B0(n2493), .B1(n2710), .Y(n2104) );
  OAI22XL U2545 ( .A0(n2483), .A1(n2713), .B0(n2495), .B1(n2710), .Y(n2103) );
  OAI22XL U2546 ( .A0(n3529), .A1(n2483), .B0(n2582), .B1(n2710), .Y(n2102) );
  OAI22XL U2547 ( .A0(n3676), .A1(n2483), .B0(n2497), .B1(n2710), .Y(n2101) );
  NAND2X1 U2548 ( .A(n2652), .B(n2483), .Y(n2710) );
  MXI2X1 U2549 ( .A(n2490), .B(n3685), .S0(n2714), .Y(n2100) );
  MXI2X1 U2550 ( .A(n2595), .B(n3684), .S0(n2714), .Y(n2099) );
  MXI2X1 U2551 ( .A(n2591), .B(n2715), .S0(n2714), .Y(n2098) );
  MXI2X1 U2552 ( .A(n2587), .B(n3683), .S0(n2714), .Y(n2097) );
  MXI2X1 U2553 ( .A(n2493), .B(n2716), .S0(n2714), .Y(n2096) );
  MXI2X1 U2554 ( .A(n2495), .B(n2717), .S0(n2714), .Y(n2095) );
  MXI2X1 U2555 ( .A(n2582), .B(n3528), .S0(n2714), .Y(n2094) );
  OAI21XL U2556 ( .A0(n2718), .A1(n2719), .B0(n2720), .Y(n2092) );
  AOI211X1 U2557 ( .A0(n2721), .A1(n2722), .B0(star), .C0(n2575), .Y(n2091) );
  OAI22XL U2558 ( .A0(n2723), .A1(n2720), .B0(n3526), .B1(n2718), .Y(n2090) );
  OAI22XL U2559 ( .A0(n2724), .A1(n2720), .B0(n3525), .B1(n2718), .Y(n2089) );
  OAI22XL U2560 ( .A0(n2725), .A1(n2720), .B0(n3524), .B1(n2718), .Y(n2088) );
  OAI22XL U2561 ( .A0(n2726), .A1(n2720), .B0(n3523), .B1(n2718), .Y(n2087) );
  OAI22XL U2562 ( .A0(n2727), .A1(n2720), .B0(n3522), .B1(n2718), .Y(n2086) );
  OAI21XL U2563 ( .A0(n2718), .A1(n2728), .B0(n2729), .Y(n2044) );
  AOI22X1 U2564 ( .A0(N286), .A1(n2730), .B0(N291), .B1(n2731), .Y(n2729) );
  OAI21XL U2565 ( .A0(n2718), .A1(n2732), .B0(n2733), .Y(n2043) );
  AOI22X1 U2566 ( .A0(N285), .A1(n2730), .B0(N290), .B1(n2731), .Y(n2733) );
  OAI21XL U2567 ( .A0(n2718), .A1(n2734), .B0(n2735), .Y(n2042) );
  OAI21XL U2568 ( .A0(n2718), .A1(n2736), .B0(n2737), .Y(n2041) );
  OAI21XL U2569 ( .A0(n2718), .A1(n2738), .B0(n2739), .Y(n2040) );
  AOI22X1 U2570 ( .A0(N282), .A1(n2730), .B0(N287), .B1(n2731), .Y(n2739) );
  NOR2X1 U2571 ( .A(n2720), .B(n2721), .Y(n2731) );
  NOR2X1 U2572 ( .A(n2720), .B(n3780), .Y(n2730) );
  OAI21XL U2573 ( .A0(n2047), .A1(ispattern), .B0(n2741), .Y(n2037) );
  OAI21XL U2574 ( .A0(n2080), .A1(ispattern), .B0(n2741), .Y(n2035) );
  AOI2BB1X1 U2575 ( .A0N(chardata[2]), .A1N(n2448), .B0(n2500), .Y(n2741) );
  MXI2X1 U2576 ( .A(n2369), .B(n2676), .S0(n2742), .Y(n2025) );
  MXI2X1 U2577 ( .A(n2388), .B(n2706), .S0(n2742), .Y(n2023) );
  CLKMX2X2 U2578 ( .A(string_length[0]), .B(str_index[0]), .S0(n2742), .Y(
        n2019) );
  NOR2BX1 U2579 ( .AN(isstring), .B(reset), .Y(n2742) );
  OAI22XL U2580 ( .A0(n2743), .A1(n2744), .B0(n2079), .B1(n2579), .Y(n1761) );
  OAI31XL U2581 ( .A0(n2745), .A1(n2499), .A2(n2746), .B0(n2747), .Y(n2744) );
  NOR4BX1 U2582 ( .AN(n3685), .B(n2748), .C(n2749), .D(n2715), .Y(n2746) );
  NAND3X1 U2583 ( .A(n2717), .B(n2716), .C(n2500), .Y(n2749) );
  NAND4X1 U2584 ( .A(n3528), .B(n3682), .C(n3683), .D(n3684), .Y(n2748) );
  NOR4X1 U2585 ( .A(n2750), .B(n2751), .C(n2752), .D(n2753), .Y(n2745) );
  XOR2X1 U2586 ( .A(n3684), .B(n2595), .Y(n2753) );
  XOR2X1 U2587 ( .A(n3683), .B(n2587), .Y(n2752) );
  NAND3X1 U2588 ( .A(n2754), .B(n2578), .C(n2755), .Y(n2751) );
  XOR2X1 U2589 ( .A(n3528), .B(n2580), .Y(n2754) );
  NAND4X1 U2590 ( .A(n2756), .B(n2757), .C(n2758), .D(n2759), .Y(n2750) );
  XOR2X1 U2591 ( .A(n3685), .B(chardata[7]), .Y(n2759) );
  XOR2X1 U2592 ( .A(n2717), .B(chardata[2]), .Y(n2758) );
  XOR2X1 U2593 ( .A(n2715), .B(chardata[5]), .Y(n2756) );
  CLKINVX1 U2594 ( .A(n2760), .Y(n2743) );
  NAND4X1 U2595 ( .A(n2761), .B(n2762), .C(n2763), .D(n2448), .Y(n1757) );
  NAND4X1 U2596 ( .A(n3681), .B(n3776), .C(n2764), .D(n2765), .Y(n2763) );
  AND4X1 U2597 ( .A(n3680), .B(n3679), .C(n3678), .D(n3559), .Y(n2765) );
  NOR3BXL U2598 ( .AN(n3777), .B(n3775), .C(n2502), .Y(n2764) );
  NAND4X1 U2599 ( .A(n2766), .B(n2767), .C(n2768), .D(n2769), .Y(n2762) );
  NOR4X1 U2600 ( .A(n2770), .B(n2771), .C(n2772), .D(n2773), .Y(n2769) );
  XOR2X1 U2601 ( .A(n3775), .B(n2591), .Y(n2773) );
  XOR2X1 U2602 ( .A(n3776), .B(n2595), .Y(n2772) );
  XOR2X1 U2603 ( .A(n3681), .B(n2582), .Y(n2771) );
  XOR2X1 U2604 ( .A(n3559), .B(n2587), .Y(n2770) );
  MXI4X1 U2605 ( .A(n2504), .B(n2505), .C(n2508), .D(n2510), .S0(n3678), .S1(
        n3679), .Y(n2768) );
  XOR2X1 U2606 ( .A(n3777), .B(chardata[7]), .Y(n2767) );
  CLKMX2X2 U2607 ( .A(n2511), .B(n2513), .S0(n3680), .Y(n2766) );
  NAND2X1 U2608 ( .A(n2577), .B(n2368), .Y(n2761) );
  OAI22XL U2609 ( .A0(n2774), .A1(n2775), .B0(n2078), .B1(n2579), .Y(n1748) );
  OAI31XL U2610 ( .A0(n2776), .A1(n2499), .A2(n2777), .B0(n2747), .Y(n2775) );
  NOR4BX1 U2611 ( .AN(n3687), .B(n2778), .C(n2779), .D(n2711), .Y(n2777) );
  NAND3X1 U2612 ( .A(n2713), .B(n2712), .C(n2500), .Y(n2779) );
  NAND4X1 U2613 ( .A(n3529), .B(n3676), .C(n3677), .D(n3686), .Y(n2778) );
  NOR4X1 U2614 ( .A(n2780), .B(n2781), .C(n2782), .D(n2783), .Y(n2776) );
  XOR2X1 U2615 ( .A(n3686), .B(n2595), .Y(n2783) );
  XOR2X1 U2616 ( .A(n3677), .B(n2587), .Y(n2782) );
  NAND3X1 U2617 ( .A(n2784), .B(ispattern), .C(n2785), .Y(n2781) );
  XOR2X1 U2618 ( .A(n3529), .B(chardata[1]), .Y(n2784) );
  NAND4X1 U2619 ( .A(n2786), .B(n2787), .C(n2788), .D(n2789), .Y(n2780) );
  XOR2X1 U2620 ( .A(n3687), .B(chardata[7]), .Y(n2789) );
  XOR2X1 U2621 ( .A(n2713), .B(chardata[2]), .Y(n2788) );
  XOR2X1 U2622 ( .A(n2711), .B(chardata[5]), .Y(n2786) );
  OAI22XL U2623 ( .A0(n2790), .A1(n2791), .B0(n2077), .B1(n2579), .Y(n1746) );
  OAI31XL U2624 ( .A0(n2792), .A1(n2499), .A2(n2793), .B0(n2747), .Y(n2791) );
  CLKINVX1 U2625 ( .A(n2794), .Y(n2747) );
  NOR4BBX1 U2626 ( .AN(n3689), .BN(n3675), .C(n2795), .D(n2796), .Y(n2793) );
  NAND3BX1 U2627 ( .AN(n3688), .B(n2500), .C(n3690), .Y(n2796) );
  NAND4X1 U2628 ( .A(n3530), .B(n3672), .C(n3673), .D(n3674), .Y(n2795) );
  NOR4X1 U2629 ( .A(n2797), .B(n2798), .C(n2799), .D(n2800), .Y(n2792) );
  MXI2X1 U2630 ( .A(n2511), .B(n2513), .S0(n3674), .Y(n2800) );
  XOR2X1 U2631 ( .A(n3690), .B(n2490), .Y(n2799) );
  MX4X1 U2632 ( .A(n2503), .B(n2505), .C(n2508), .D(n2509), .S0(n3672), .S1(
        n3673), .Y(n2798) );
  NAND4X1 U2633 ( .A(n2801), .B(n2802), .C(n2803), .D(n2804), .Y(n2797) );
  XOR2X1 U2634 ( .A(n3675), .B(chardata[1]), .Y(n2804) );
  XOR2X1 U2635 ( .A(n3530), .B(n2584), .Y(n2803) );
  XOR2X1 U2636 ( .A(n3688), .B(n2590), .Y(n2802) );
  XOR2X1 U2637 ( .A(n3689), .B(n2592), .Y(n2801) );
  OAI22XL U2638 ( .A0(n2076), .A1(n2578), .B0(n2794), .B1(n2805), .Y(n1744) );
  OAI31XL U2639 ( .A0(n2806), .A1(n2499), .A2(n2807), .B0(n2734), .Y(n2805) );
  NOR4BBX1 U2640 ( .AN(n3692), .BN(n3671), .C(n2808), .D(n2809), .Y(n2807) );
  NAND3BX1 U2641 ( .AN(n3691), .B(n2500), .C(n3693), .Y(n2809) );
  NAND4X1 U2642 ( .A(n3531), .B(n3668), .C(n3669), .D(n3670), .Y(n2808) );
  NOR4X1 U2643 ( .A(n2810), .B(n2811), .C(n2812), .D(n2813), .Y(n2806) );
  MXI2X1 U2644 ( .A(n2511), .B(n2513), .S0(n3670), .Y(n2813) );
  XOR2X1 U2645 ( .A(n3693), .B(n2490), .Y(n2812) );
  MX4X1 U2646 ( .A(n2504), .B(n2505), .C(n2508), .D(n2509), .S0(n3668), .S1(
        n3669), .Y(n2811) );
  NAND4X1 U2647 ( .A(n2814), .B(n2815), .C(n2816), .D(n2817), .Y(n2810) );
  XOR2X1 U2648 ( .A(n3531), .B(n2585), .Y(n2817) );
  XOR2X1 U2649 ( .A(n3671), .B(chardata[1]), .Y(n2816) );
  XOR2X1 U2650 ( .A(n3692), .B(n2593), .Y(n2815) );
  XOR2X1 U2651 ( .A(n3691), .B(n2590), .Y(n2814) );
  OAI22XL U2652 ( .A0(n2794), .A1(n2818), .B0(n2075), .B1(n2579), .Y(n1742) );
  OAI31XL U2653 ( .A0(n2819), .A1(n2499), .A2(n2820), .B0(n2821), .Y(n2818) );
  NOR4BBX1 U2654 ( .AN(n3695), .BN(n3667), .C(n2822), .D(n2823), .Y(n2820) );
  NAND3BX1 U2655 ( .AN(n3694), .B(n2500), .C(n3696), .Y(n2823) );
  NAND4X1 U2656 ( .A(n3532), .B(n3664), .C(n3665), .D(n3666), .Y(n2822) );
  NOR4X1 U2657 ( .A(n2824), .B(n2825), .C(n2826), .D(n2827), .Y(n2819) );
  MXI2X1 U2658 ( .A(n2511), .B(n2513), .S0(n3666), .Y(n2827) );
  XOR2X1 U2659 ( .A(n3696), .B(n2490), .Y(n2826) );
  MX4X1 U2660 ( .A(n2504), .B(n2505), .C(n2508), .D(n2509), .S0(n3664), .S1(
        n3665), .Y(n2825) );
  NAND4X1 U2661 ( .A(n2828), .B(n2829), .C(n2830), .D(n2831), .Y(n2824) );
  XOR2X1 U2662 ( .A(n3667), .B(chardata[1]), .Y(n2831) );
  XOR2X1 U2663 ( .A(n3532), .B(n2585), .Y(n2830) );
  XOR2X1 U2664 ( .A(n3694), .B(n2590), .Y(n2829) );
  XOR2X1 U2665 ( .A(n3695), .B(n2593), .Y(n2828) );
  OAI22XL U2666 ( .A0(n2794), .A1(n2832), .B0(n2074), .B1(n2579), .Y(n1740) );
  OAI31XL U2667 ( .A0(n2833), .A1(n2499), .A2(n2834), .B0(n2835), .Y(n2832) );
  NOR4BBX1 U2668 ( .AN(n3698), .BN(n3663), .C(n2836), .D(n2837), .Y(n2834) );
  NAND3BX1 U2669 ( .AN(n3697), .B(n2500), .C(n3699), .Y(n2837) );
  NAND4X1 U2670 ( .A(n3533), .B(n3660), .C(n3661), .D(n3662), .Y(n2836) );
  NOR4X1 U2671 ( .A(n2838), .B(n2839), .C(n2840), .D(n2841), .Y(n2833) );
  MXI2X1 U2672 ( .A(n2511), .B(n2513), .S0(n3662), .Y(n2841) );
  XOR2X1 U2673 ( .A(n3699), .B(n2490), .Y(n2840) );
  MX4X1 U2674 ( .A(n2504), .B(n2505), .C(n2508), .D(n2509), .S0(n3660), .S1(
        n3661), .Y(n2839) );
  NAND4X1 U2675 ( .A(n2842), .B(n2843), .C(n2844), .D(n2845), .Y(n2838) );
  XOR2X1 U2676 ( .A(n3663), .B(chardata[1]), .Y(n2845) );
  XOR2X1 U2677 ( .A(n3533), .B(n2585), .Y(n2844) );
  XOR2X1 U2678 ( .A(n3697), .B(n2590), .Y(n2843) );
  XOR2X1 U2679 ( .A(n3698), .B(n2593), .Y(n2842) );
  OAI22XL U2680 ( .A0(n2794), .A1(n2846), .B0(n2073), .B1(n2579), .Y(n1738) );
  OAI31XL U2681 ( .A0(n2847), .A1(n2499), .A2(n2848), .B0(n2849), .Y(n2846) );
  NOR4BBX1 U2682 ( .AN(n3701), .BN(n3659), .C(n2850), .D(n2851), .Y(n2848) );
  NAND3BX1 U2683 ( .AN(n3700), .B(n2500), .C(n3702), .Y(n2851) );
  NAND4X1 U2684 ( .A(n3534), .B(n3656), .C(n3657), .D(n3658), .Y(n2850) );
  NOR4X1 U2685 ( .A(n2852), .B(n2853), .C(n2854), .D(n2855), .Y(n2847) );
  MXI2X1 U2686 ( .A(n2511), .B(n2513), .S0(n3658), .Y(n2855) );
  XOR2X1 U2687 ( .A(n3702), .B(n2490), .Y(n2854) );
  MX4X1 U2688 ( .A(n2504), .B(n2505), .C(n2508), .D(n2509), .S0(n3656), .S1(
        n3657), .Y(n2853) );
  NAND4X1 U2689 ( .A(n2856), .B(n2857), .C(n2858), .D(n2859), .Y(n2852) );
  XOR2X1 U2690 ( .A(n3659), .B(chardata[1]), .Y(n2859) );
  XOR2X1 U2691 ( .A(n3534), .B(n2585), .Y(n2858) );
  XOR2X1 U2692 ( .A(n3700), .B(n2590), .Y(n2857) );
  XOR2X1 U2693 ( .A(n3701), .B(n2593), .Y(n2856) );
  OAI22XL U2694 ( .A0(n2072), .A1(ispattern), .B0(n2860), .B1(n2794), .Y(n1736) );
  NAND2X1 U2695 ( .A(n2728), .B(n2732), .Y(n2794) );
  AOI211X1 U2696 ( .A0(n2861), .A1(n2862), .B0(n2863), .C0(n2498), .Y(n2860)
         );
  NOR4X1 U2697 ( .A(n2864), .B(n2865), .C(n2866), .D(n2867), .Y(n2863) );
  MXI2X1 U2698 ( .A(n2512), .B(n2513), .S0(n3654), .Y(n2867) );
  XOR2X1 U2699 ( .A(n3705), .B(n2489), .Y(n2866) );
  MX4X1 U2700 ( .A(n2504), .B(n2506), .C(n2508), .D(n2510), .S0(n3652), .S1(
        n3653), .Y(n2865) );
  NAND4X1 U2701 ( .A(n2868), .B(n2869), .C(n2870), .D(n2871), .Y(n2864) );
  XOR2X1 U2702 ( .A(n3535), .B(n2585), .Y(n2871) );
  XOR2X1 U2703 ( .A(n3655), .B(chardata[1]), .Y(n2870) );
  XOR2X1 U2704 ( .A(n3704), .B(n2593), .Y(n2869) );
  XOR2X1 U2705 ( .A(n3703), .B(chardata[5]), .Y(n2868) );
  NOR4BX1 U2706 ( .AN(n3705), .B(n2872), .C(n3703), .D(n2502), .Y(n2862) );
  NAND2X1 U2707 ( .A(n3655), .B(n3704), .Y(n2872) );
  AND4X1 U2708 ( .A(n3654), .B(n3653), .C(n3652), .D(n3535), .Y(n2861) );
  OAI22XL U2709 ( .A0(n2873), .A1(n2874), .B0(n2071), .B1(n2579), .Y(n1734) );
  OAI31XL U2710 ( .A0(n2875), .A1(n2499), .A2(n2876), .B0(n2728), .Y(n2874) );
  NOR4BBX1 U2711 ( .AN(n3707), .BN(n3651), .C(n2877), .D(n2878), .Y(n2876) );
  NAND3BX1 U2712 ( .AN(n3706), .B(n2500), .C(n3708), .Y(n2878) );
  NAND4X1 U2713 ( .A(n3536), .B(n3648), .C(n3649), .D(n3650), .Y(n2877) );
  NOR4X1 U2714 ( .A(n2879), .B(n2880), .C(n2881), .D(n2882), .Y(n2875) );
  MXI2X1 U2715 ( .A(n2511), .B(n2513), .S0(n3650), .Y(n2882) );
  XOR2X1 U2716 ( .A(n3708), .B(n2489), .Y(n2881) );
  MX4X1 U2717 ( .A(n2504), .B(n2505), .C(n2508), .D(n2509), .S0(n3648), .S1(
        n3649), .Y(n2880) );
  NAND4X1 U2718 ( .A(n2883), .B(n2884), .C(n2885), .D(n2886), .Y(n2879) );
  XOR2X1 U2719 ( .A(n3651), .B(n2580), .Y(n2886) );
  XOR2X1 U2720 ( .A(n3536), .B(n2585), .Y(n2885) );
  XOR2X1 U2721 ( .A(n3706), .B(n2590), .Y(n2884) );
  XOR2X1 U2722 ( .A(n3707), .B(n2593), .Y(n2883) );
  NOR2X1 U2723 ( .A(n2760), .B(n2732), .Y(n2873) );
  OAI22XL U2724 ( .A0(n2887), .A1(n2888), .B0(n2070), .B1(n2579), .Y(n1732) );
  OAI31XL U2725 ( .A0(n2889), .A1(n2499), .A2(n2890), .B0(n2728), .Y(n2888) );
  NOR4BBX1 U2726 ( .AN(n3710), .BN(n3647), .C(n2891), .D(n2892), .Y(n2890) );
  NAND3BX1 U2727 ( .AN(n3709), .B(n2500), .C(n3711), .Y(n2892) );
  NAND4X1 U2728 ( .A(n3537), .B(n3644), .C(n3645), .D(n3646), .Y(n2891) );
  NOR4X1 U2729 ( .A(n2893), .B(n2894), .C(n2895), .D(n2896), .Y(n2889) );
  MXI2X1 U2730 ( .A(n2511), .B(n2513), .S0(n3646), .Y(n2896) );
  XOR2X1 U2731 ( .A(n3711), .B(n2489), .Y(n2895) );
  MX4X1 U2732 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3644), .S1(
        n3645), .Y(n2894) );
  NAND4X1 U2733 ( .A(n2897), .B(n2898), .C(n2899), .D(n2900), .Y(n2893) );
  XOR2X1 U2734 ( .A(n3647), .B(n2580), .Y(n2900) );
  XOR2X1 U2735 ( .A(n3537), .B(n2585), .Y(n2899) );
  XOR2X1 U2736 ( .A(n3709), .B(n2590), .Y(n2898) );
  XOR2X1 U2737 ( .A(n3710), .B(n2593), .Y(n2897) );
  NOR2X1 U2738 ( .A(n2901), .B(n2732), .Y(n2887) );
  OAI22XL U2739 ( .A0(n2902), .A1(n2903), .B0(n2069), .B1(n2579), .Y(n1730) );
  OAI31XL U2740 ( .A0(n2904), .A1(n2499), .A2(n2905), .B0(n2728), .Y(n2903) );
  NOR4BBX1 U2741 ( .AN(n3713), .BN(n3643), .C(n2906), .D(n2907), .Y(n2905) );
  NAND3BX1 U2742 ( .AN(n3712), .B(n2500), .C(n3714), .Y(n2907) );
  NAND4X1 U2743 ( .A(n3538), .B(n3640), .C(n3641), .D(n3642), .Y(n2906) );
  NOR4X1 U2744 ( .A(n2908), .B(n2909), .C(n2910), .D(n2911), .Y(n2904) );
  MXI2X1 U2745 ( .A(n2511), .B(n2513), .S0(n3642), .Y(n2911) );
  XOR2X1 U2746 ( .A(n3714), .B(n2489), .Y(n2910) );
  MX4X1 U2747 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3640), .S1(
        n3641), .Y(n2909) );
  NAND4X1 U2748 ( .A(n2912), .B(n2913), .C(n2914), .D(n2915), .Y(n2908) );
  XOR2X1 U2749 ( .A(n3643), .B(n2580), .Y(n2915) );
  XOR2X1 U2750 ( .A(n3538), .B(n2585), .Y(n2914) );
  XOR2X1 U2751 ( .A(n3712), .B(n2590), .Y(n2913) );
  XOR2X1 U2752 ( .A(n3713), .B(n2593), .Y(n2912) );
  NOR2X1 U2753 ( .A(n2916), .B(n2732), .Y(n2902) );
  OAI22XL U2754 ( .A0(n2917), .A1(n2918), .B0(n2068), .B1(n2579), .Y(n1728) );
  OAI31XL U2755 ( .A0(n2919), .A1(n2499), .A2(n2920), .B0(n2728), .Y(n2918) );
  NOR4BBX1 U2756 ( .AN(n3716), .BN(n3639), .C(n2921), .D(n2922), .Y(n2920) );
  NAND3BX1 U2757 ( .AN(n3715), .B(n2500), .C(n3717), .Y(n2922) );
  NAND4X1 U2758 ( .A(n3539), .B(n3636), .C(n3637), .D(n3638), .Y(n2921) );
  NOR4X1 U2759 ( .A(n2923), .B(n2924), .C(n2925), .D(n2926), .Y(n2919) );
  MXI2X1 U2760 ( .A(n2511), .B(n2513), .S0(n3638), .Y(n2926) );
  XOR2X1 U2761 ( .A(n3717), .B(n2489), .Y(n2925) );
  MX4X1 U2762 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3636), .S1(
        n3637), .Y(n2924) );
  NAND4X1 U2763 ( .A(n2927), .B(n2928), .C(n2929), .D(n2930), .Y(n2923) );
  XOR2X1 U2764 ( .A(n3639), .B(n2580), .Y(n2930) );
  XOR2X1 U2765 ( .A(n3539), .B(n2585), .Y(n2929) );
  XOR2X1 U2766 ( .A(n3715), .B(n2590), .Y(n2928) );
  XOR2X1 U2767 ( .A(n3716), .B(n2593), .Y(n2927) );
  NOR2X1 U2768 ( .A(n2732), .B(n2734), .Y(n2917) );
  OAI22XL U2769 ( .A0(n2931), .A1(n2932), .B0(n2067), .B1(n2579), .Y(n1726) );
  OAI31XL U2770 ( .A0(n2933), .A1(n2499), .A2(n2934), .B0(n2728), .Y(n2932) );
  NOR4BBX1 U2771 ( .AN(n3719), .BN(n3635), .C(n2935), .D(n2936), .Y(n2934) );
  NAND3BX1 U2772 ( .AN(n3718), .B(n2500), .C(n3720), .Y(n2936) );
  NAND4X1 U2773 ( .A(n3540), .B(n3632), .C(n3633), .D(n3634), .Y(n2935) );
  NOR4X1 U2774 ( .A(n2937), .B(n2938), .C(n2939), .D(n2940), .Y(n2933) );
  MXI2X1 U2775 ( .A(n2511), .B(n2513), .S0(n3634), .Y(n2940) );
  XOR2X1 U2776 ( .A(n3720), .B(n2489), .Y(n2939) );
  MX4X1 U2777 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3632), .S1(
        n3633), .Y(n2938) );
  NAND4X1 U2778 ( .A(n2941), .B(n2942), .C(n2943), .D(n2944), .Y(n2937) );
  XOR2X1 U2779 ( .A(n3635), .B(n2580), .Y(n2944) );
  XOR2X1 U2780 ( .A(n3540), .B(n2585), .Y(n2943) );
  XOR2X1 U2781 ( .A(n3718), .B(n2590), .Y(n2942) );
  XOR2X1 U2782 ( .A(n3719), .B(n2593), .Y(n2941) );
  NOR2X1 U2783 ( .A(n2732), .B(n2821), .Y(n2931) );
  OAI22XL U2784 ( .A0(n2945), .A1(n2946), .B0(n2066), .B1(n2579), .Y(n1724) );
  OAI31XL U2785 ( .A0(n2947), .A1(n2499), .A2(n2948), .B0(n2728), .Y(n2946) );
  NOR4BBX1 U2786 ( .AN(n3722), .BN(n3631), .C(n2949), .D(n2950), .Y(n2948) );
  NAND3BX1 U2787 ( .AN(n3721), .B(n2501), .C(n3723), .Y(n2950) );
  NAND4X1 U2788 ( .A(n3541), .B(n3628), .C(n3629), .D(n3630), .Y(n2949) );
  NOR4X1 U2789 ( .A(n2951), .B(n2952), .C(n2953), .D(n2954), .Y(n2947) );
  MXI2X1 U2790 ( .A(n2512), .B(n2513), .S0(n3630), .Y(n2954) );
  XOR2X1 U2791 ( .A(n3723), .B(n2489), .Y(n2953) );
  MX4X1 U2792 ( .A(n2446), .B(n2506), .C(n2508), .D(n2509), .S0(n3628), .S1(
        n3629), .Y(n2952) );
  NAND4X1 U2793 ( .A(n2955), .B(n2956), .C(n2957), .D(n2958), .Y(n2951) );
  XOR2X1 U2794 ( .A(n3631), .B(n2580), .Y(n2958) );
  XOR2X1 U2795 ( .A(n3541), .B(n2585), .Y(n2957) );
  XOR2X1 U2796 ( .A(n3721), .B(n2590), .Y(n2956) );
  XOR2X1 U2797 ( .A(n3722), .B(n2593), .Y(n2955) );
  NOR2X1 U2798 ( .A(n2732), .B(n2835), .Y(n2945) );
  OAI22XL U2799 ( .A0(n2959), .A1(n2960), .B0(n2065), .B1(n2579), .Y(n1722) );
  OAI31XL U2800 ( .A0(n2961), .A1(n2499), .A2(n2962), .B0(n2728), .Y(n2960) );
  NOR4BBX1 U2801 ( .AN(n3725), .BN(n3627), .C(n2963), .D(n2964), .Y(n2962) );
  NAND3BX1 U2802 ( .AN(n3724), .B(n2501), .C(n3726), .Y(n2964) );
  NAND4X1 U2803 ( .A(n3542), .B(n3624), .C(n3625), .D(n3626), .Y(n2963) );
  NOR4X1 U2804 ( .A(n2965), .B(n2966), .C(n2967), .D(n2968), .Y(n2961) );
  MXI2X1 U2805 ( .A(n2512), .B(n2514), .S0(n3626), .Y(n2968) );
  XOR2X1 U2806 ( .A(n3726), .B(n2489), .Y(n2967) );
  MX4X1 U2807 ( .A(n2446), .B(n2506), .C(n2508), .D(n2509), .S0(n3624), .S1(
        n3625), .Y(n2966) );
  NAND4X1 U2808 ( .A(n2969), .B(n2970), .C(n2971), .D(n2972), .Y(n2965) );
  XOR2X1 U2809 ( .A(n3627), .B(chardata[1]), .Y(n2972) );
  XOR2X1 U2810 ( .A(n3542), .B(n2585), .Y(n2971) );
  XOR2X1 U2811 ( .A(n3724), .B(n2590), .Y(n2970) );
  XOR2X1 U2812 ( .A(n3725), .B(n2593), .Y(n2969) );
  NOR2X1 U2813 ( .A(n2732), .B(n2849), .Y(n2959) );
  OAI22XL U2814 ( .A0(n2064), .A1(ispattern), .B0(star_index[4]), .B1(n2973), 
        .Y(n1720) );
  AOI211X1 U2815 ( .A0(n2974), .A1(n2975), .B0(n2976), .C0(n2498), .Y(n2973)
         );
  NOR4X1 U2816 ( .A(n2977), .B(n2978), .C(n2979), .D(n2980), .Y(n2976) );
  MXI2X1 U2817 ( .A(n2512), .B(n2514), .S0(n3622), .Y(n2980) );
  XOR2X1 U2818 ( .A(n3729), .B(n2489), .Y(n2979) );
  MX4X1 U2819 ( .A(n2504), .B(n2506), .C(n2508), .D(n2510), .S0(n3620), .S1(
        n3621), .Y(n2978) );
  NAND4X1 U2820 ( .A(n2981), .B(n2982), .C(n2983), .D(n2984), .Y(n2977) );
  XOR2X1 U2821 ( .A(n3543), .B(n2585), .Y(n2984) );
  XOR2X1 U2822 ( .A(n3623), .B(chardata[1]), .Y(n2983) );
  XOR2X1 U2823 ( .A(n3728), .B(n2593), .Y(n2982) );
  XOR2X1 U2824 ( .A(n3727), .B(n2590), .Y(n2981) );
  NOR4BX1 U2825 ( .AN(n3729), .B(n2985), .C(n3727), .D(n2502), .Y(n2975) );
  NAND2X1 U2826 ( .A(n3623), .B(n3728), .Y(n2985) );
  AND4X1 U2827 ( .A(n3622), .B(n3621), .C(n3620), .D(n3543), .Y(n2974) );
  OAI22XL U2828 ( .A0(n2986), .A1(n2987), .B0(n2063), .B1(n2579), .Y(n1718) );
  OAI31XL U2829 ( .A0(n2988), .A1(n2499), .A2(n2989), .B0(n2990), .Y(n2987) );
  NOR4BBX1 U2830 ( .AN(n3731), .BN(n3619), .C(n2991), .D(n2992), .Y(n2989) );
  NAND3BX1 U2831 ( .AN(n3730), .B(n2501), .C(n3732), .Y(n2992) );
  NAND4X1 U2832 ( .A(n3544), .B(n3616), .C(n3617), .D(n3618), .Y(n2991) );
  NOR4X1 U2833 ( .A(n2993), .B(n2994), .C(n2995), .D(n2996), .Y(n2988) );
  MXI2X1 U2834 ( .A(n2512), .B(n2514), .S0(n3618), .Y(n2996) );
  XOR2X1 U2835 ( .A(n3732), .B(n2489), .Y(n2995) );
  MX4X1 U2836 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3616), .S1(
        n3617), .Y(n2994) );
  NAND4X1 U2837 ( .A(n2997), .B(n2998), .C(n2999), .D(n3000), .Y(n2993) );
  XOR2X1 U2838 ( .A(n3619), .B(chardata[1]), .Y(n3000) );
  XOR2X1 U2839 ( .A(n3544), .B(n2585), .Y(n2999) );
  XOR2X1 U2840 ( .A(n3730), .B(n2590), .Y(n2998) );
  XOR2X1 U2841 ( .A(n3731), .B(n2593), .Y(n2997) );
  NOR2X1 U2842 ( .A(n2760), .B(n2728), .Y(n2986) );
  OAI22XL U2843 ( .A0(n3001), .A1(n3002), .B0(n2062), .B1(n2579), .Y(n1716) );
  OAI31XL U2844 ( .A0(n3003), .A1(n2499), .A2(n3004), .B0(n2990), .Y(n3002) );
  NOR4BBX1 U2845 ( .AN(n3734), .BN(n3615), .C(n3005), .D(n3006), .Y(n3004) );
  NAND3BX1 U2846 ( .AN(n3733), .B(n2501), .C(n3735), .Y(n3006) );
  NAND4X1 U2847 ( .A(n3545), .B(n3612), .C(n3613), .D(n3614), .Y(n3005) );
  NOR4X1 U2848 ( .A(n3007), .B(n3008), .C(n3009), .D(n3010), .Y(n3003) );
  MXI2X1 U2849 ( .A(n2512), .B(n2514), .S0(n3614), .Y(n3010) );
  XOR2X1 U2850 ( .A(n3735), .B(n2489), .Y(n3009) );
  MX4X1 U2851 ( .A(n2504), .B(n2506), .C(n2508), .D(n2509), .S0(n3612), .S1(
        n3613), .Y(n3008) );
  NAND4X1 U2852 ( .A(n3011), .B(n3012), .C(n3013), .D(n3014), .Y(n3007) );
  XOR2X1 U2853 ( .A(n3615), .B(chardata[1]), .Y(n3014) );
  XOR2X1 U2854 ( .A(n3545), .B(n2585), .Y(n3013) );
  XOR2X1 U2855 ( .A(n3733), .B(n2590), .Y(n3012) );
  XOR2X1 U2856 ( .A(n3734), .B(n2593), .Y(n3011) );
  NOR2X1 U2857 ( .A(n2901), .B(n2728), .Y(n3001) );
  OAI22XL U2858 ( .A0(n3015), .A1(n3016), .B0(n2061), .B1(n2579), .Y(n1714) );
  OAI31XL U2859 ( .A0(n3017), .A1(n2498), .A2(n3018), .B0(n2990), .Y(n3016) );
  NOR4BBX1 U2860 ( .AN(n3737), .BN(n3611), .C(n3019), .D(n3020), .Y(n3018) );
  NAND3BX1 U2861 ( .AN(n3736), .B(n2501), .C(n3738), .Y(n3020) );
  NAND4X1 U2862 ( .A(n3546), .B(n3608), .C(n3609), .D(n3610), .Y(n3019) );
  NOR4X1 U2863 ( .A(n3021), .B(n3022), .C(n3023), .D(n3024), .Y(n3017) );
  MXI2X1 U2864 ( .A(n2512), .B(n2514), .S0(n3610), .Y(n3024) );
  XOR2X1 U2865 ( .A(n3738), .B(n2489), .Y(n3023) );
  MX4X1 U2866 ( .A(n2503), .B(n2506), .C(n2508), .D(n2510), .S0(n3608), .S1(
        n3609), .Y(n3022) );
  NAND4X1 U2867 ( .A(n3025), .B(n3026), .C(n3027), .D(n3028), .Y(n3021) );
  XOR2X1 U2868 ( .A(n3611), .B(chardata[1]), .Y(n3028) );
  XOR2X1 U2869 ( .A(n3546), .B(n2585), .Y(n3027) );
  XOR2X1 U2870 ( .A(n3736), .B(n2590), .Y(n3026) );
  XOR2X1 U2871 ( .A(n3737), .B(n2593), .Y(n3025) );
  NOR2X1 U2872 ( .A(n2916), .B(n2728), .Y(n3015) );
  OAI22XL U2873 ( .A0(n3029), .A1(n3030), .B0(n2060), .B1(ispattern), .Y(n1712) );
  OAI31XL U2874 ( .A0(n3031), .A1(n2498), .A2(n3032), .B0(n2990), .Y(n3030) );
  NOR4BBX1 U2875 ( .AN(n3740), .BN(n3607), .C(n3033), .D(n3034), .Y(n3032) );
  NAND3BX1 U2876 ( .AN(n3739), .B(n2501), .C(n3741), .Y(n3034) );
  NAND4X1 U2877 ( .A(n3547), .B(n3604), .C(n3605), .D(n3606), .Y(n3033) );
  NOR4X1 U2878 ( .A(n3035), .B(n3036), .C(n3037), .D(n3038), .Y(n3031) );
  MXI2X1 U2879 ( .A(n2512), .B(n2514), .S0(n3606), .Y(n3038) );
  XOR2X1 U2880 ( .A(n3741), .B(n2616), .Y(n3037) );
  NAND4X1 U2881 ( .A(n3039), .B(n3040), .C(n3041), .D(n3042), .Y(n3035) );
  XOR2X1 U2882 ( .A(n3607), .B(n2580), .Y(n3042) );
  XOR2X1 U2883 ( .A(n3547), .B(n2585), .Y(n3041) );
  XOR2X1 U2884 ( .A(n3739), .B(n2590), .Y(n3040) );
  XOR2X1 U2885 ( .A(n3740), .B(n2592), .Y(n3039) );
  NOR2X1 U2886 ( .A(n2728), .B(n2734), .Y(n3029) );
  OAI22XL U2887 ( .A0(n3043), .A1(n3044), .B0(n2059), .B1(ispattern), .Y(n1710) );
  OAI31XL U2888 ( .A0(n3045), .A1(n2499), .A2(n3046), .B0(n2990), .Y(n3044) );
  NOR4BBX1 U2889 ( .AN(n3743), .BN(n3603), .C(n3047), .D(n3048), .Y(n3046) );
  NAND3BX1 U2890 ( .AN(n3742), .B(n2501), .C(n3744), .Y(n3048) );
  NAND4X1 U2891 ( .A(n3548), .B(n3600), .C(n3601), .D(n3602), .Y(n3047) );
  NOR4X1 U2892 ( .A(n3049), .B(n3050), .C(n3051), .D(n3052), .Y(n3045) );
  MXI2X1 U2893 ( .A(n2512), .B(n2514), .S0(n3602), .Y(n3052) );
  XOR2X1 U2894 ( .A(n3744), .B(n2616), .Y(n3051) );
  NAND4X1 U2895 ( .A(n3053), .B(n3054), .C(n3055), .D(n3056), .Y(n3049) );
  XOR2X1 U2896 ( .A(n3603), .B(n2580), .Y(n3056) );
  XOR2X1 U2897 ( .A(n3548), .B(n2584), .Y(n3055) );
  XOR2X1 U2898 ( .A(n3742), .B(n2589), .Y(n3054) );
  XOR2X1 U2899 ( .A(n3743), .B(n2592), .Y(n3053) );
  NOR2X1 U2900 ( .A(n2728), .B(n2821), .Y(n3043) );
  OAI22XL U2901 ( .A0(n3057), .A1(n3058), .B0(n2058), .B1(ispattern), .Y(n1708) );
  OAI31XL U2902 ( .A0(n3059), .A1(n2499), .A2(n3060), .B0(n2990), .Y(n3058) );
  NOR4BBX1 U2903 ( .AN(n3746), .BN(n3599), .C(n3061), .D(n3062), .Y(n3060) );
  NAND3BX1 U2904 ( .AN(n3745), .B(n2501), .C(n3747), .Y(n3062) );
  NAND4X1 U2905 ( .A(n3549), .B(n3596), .C(n3597), .D(n3598), .Y(n3061) );
  NOR4X1 U2906 ( .A(n3063), .B(n3064), .C(n3065), .D(n3066), .Y(n3059) );
  MXI2X1 U2907 ( .A(n2512), .B(n2514), .S0(n3598), .Y(n3066) );
  XOR2X1 U2908 ( .A(n3747), .B(n2616), .Y(n3065) );
  NAND4X1 U2909 ( .A(n3067), .B(n3068), .C(n3069), .D(n3070), .Y(n3063) );
  XOR2X1 U2910 ( .A(n3599), .B(n2580), .Y(n3070) );
  XOR2X1 U2911 ( .A(n3549), .B(n2584), .Y(n3069) );
  XOR2X1 U2912 ( .A(n3745), .B(n2590), .Y(n3068) );
  XOR2X1 U2913 ( .A(n3746), .B(n2592), .Y(n3067) );
  NOR2X1 U2914 ( .A(n2728), .B(n2835), .Y(n3057) );
  OAI22XL U2915 ( .A0(n3071), .A1(n3072), .B0(n2057), .B1(ispattern), .Y(n1706) );
  OAI31XL U2916 ( .A0(n3073), .A1(n2499), .A2(n3074), .B0(n2990), .Y(n3072) );
  NOR4BBX1 U2917 ( .AN(n3749), .BN(n3595), .C(n3075), .D(n3076), .Y(n3074) );
  NAND3BX1 U2918 ( .AN(n3748), .B(n2501), .C(n3750), .Y(n3076) );
  NAND4X1 U2919 ( .A(n3550), .B(n3592), .C(n3593), .D(n3594), .Y(n3075) );
  NOR4X1 U2920 ( .A(n3077), .B(n3078), .C(n3079), .D(n3080), .Y(n3073) );
  MXI2X1 U2921 ( .A(n2512), .B(n2514), .S0(n3594), .Y(n3080) );
  XOR2X1 U2922 ( .A(n3750), .B(n2616), .Y(n3079) );
  NAND4X1 U2923 ( .A(n3081), .B(n3082), .C(n3083), .D(n3084), .Y(n3077) );
  XOR2X1 U2924 ( .A(n3595), .B(n2580), .Y(n3084) );
  XOR2X1 U2925 ( .A(n3550), .B(n2584), .Y(n3083) );
  XOR2X1 U2926 ( .A(n3748), .B(n2589), .Y(n3082) );
  XOR2X1 U2927 ( .A(n3749), .B(n2592), .Y(n3081) );
  NOR2X1 U2928 ( .A(n2728), .B(n2849), .Y(n3071) );
  OAI22XL U2929 ( .A0(n3085), .A1(n3086), .B0(n2056), .B1(ispattern), .Y(n1704) );
  CLKINVX1 U2930 ( .A(n2990), .Y(n3086) );
  AOI211X1 U2931 ( .A0(n3087), .A1(n3088), .B0(n3089), .C0(n2498), .Y(n3085)
         );
  NOR4X1 U2932 ( .A(n3090), .B(n3091), .C(n3092), .D(n3093), .Y(n3089) );
  MXI2X1 U2933 ( .A(n2512), .B(n2514), .S0(n3590), .Y(n3093) );
  XOR2X1 U2934 ( .A(n3753), .B(n2488), .Y(n3092) );
  NAND4X1 U2935 ( .A(n3094), .B(n3095), .C(n3096), .D(n3097), .Y(n3090) );
  XOR2X1 U2936 ( .A(n3591), .B(n2580), .Y(n3097) );
  XOR2X1 U2937 ( .A(n3551), .B(n2584), .Y(n3096) );
  XOR2X1 U2938 ( .A(n3751), .B(n2589), .Y(n3095) );
  XOR2X1 U2939 ( .A(n3752), .B(n2592), .Y(n3094) );
  NOR4BX1 U2940 ( .AN(n3753), .B(n3098), .C(n3751), .D(n2353), .Y(n3088) );
  NAND2X1 U2941 ( .A(n3591), .B(n3752), .Y(n3098) );
  AND4X1 U2942 ( .A(n3590), .B(n3589), .C(n3588), .D(n3551), .Y(n3087) );
  OAI21XL U2943 ( .A0(n2055), .A1(ispattern), .B0(n3099), .Y(n1702) );
  OAI32X1 U2944 ( .A0(n3100), .A1(n2498), .A2(n3101), .B0(n2760), .B1(n2990), 
        .Y(n3099) );
  NOR2X1 U2945 ( .A(n3102), .B(star_index[2]), .Y(n2760) );
  NOR4BBX1 U2946 ( .AN(n3755), .BN(n3587), .C(n3103), .D(n3104), .Y(n3101) );
  NAND3BX1 U2947 ( .AN(n3754), .B(n2501), .C(n3756), .Y(n3104) );
  NAND4X1 U2948 ( .A(n3552), .B(n3584), .C(n3585), .D(n3586), .Y(n3103) );
  NOR4X1 U2949 ( .A(n3105), .B(n3106), .C(n3107), .D(n3108), .Y(n3100) );
  MXI2X1 U2950 ( .A(n2512), .B(n2514), .S0(n3586), .Y(n3108) );
  XOR2X1 U2951 ( .A(n3756), .B(n2488), .Y(n3107) );
  NAND4X1 U2952 ( .A(n3109), .B(n3110), .C(n3111), .D(n3112), .Y(n3105) );
  XOR2X1 U2953 ( .A(n3587), .B(n2580), .Y(n3112) );
  XOR2X1 U2954 ( .A(n3552), .B(n2584), .Y(n3111) );
  XOR2X1 U2955 ( .A(n3754), .B(n2589), .Y(n3110) );
  XOR2X1 U2956 ( .A(n3755), .B(n2592), .Y(n3109) );
  OAI21XL U2957 ( .A0(n2054), .A1(ispattern), .B0(n3113), .Y(n1700) );
  OAI32X1 U2958 ( .A0(n3114), .A1(n2498), .A2(n3115), .B0(n2901), .B1(n2990), 
        .Y(n3113) );
  CLKINVX1 U2959 ( .A(n2774), .Y(n2901) );
  NAND2X1 U2960 ( .A(n2734), .B(n2736), .Y(n2774) );
  NOR4BBX1 U2961 ( .AN(n3758), .BN(n3583), .C(n3116), .D(n3117), .Y(n3115) );
  NAND3BX1 U2962 ( .AN(n3757), .B(n2501), .C(n3759), .Y(n3117) );
  NAND4X1 U2963 ( .A(n3553), .B(n3580), .C(n3581), .D(n3582), .Y(n3116) );
  NOR4X1 U2964 ( .A(n3118), .B(n3119), .C(n3120), .D(n3121), .Y(n3114) );
  MXI2X1 U2965 ( .A(n2350), .B(n2514), .S0(n3582), .Y(n3121) );
  XOR2X1 U2966 ( .A(n3759), .B(n2488), .Y(n3120) );
  NAND4X1 U2967 ( .A(n3122), .B(n3123), .C(n3124), .D(n3125), .Y(n3118) );
  XOR2X1 U2968 ( .A(n3583), .B(n2580), .Y(n3125) );
  XOR2X1 U2969 ( .A(n3553), .B(n2584), .Y(n3124) );
  XOR2X1 U2970 ( .A(n3757), .B(n2589), .Y(n3123) );
  XOR2X1 U2971 ( .A(n3758), .B(n2592), .Y(n3122) );
  OAI21XL U2972 ( .A0(n2053), .A1(ispattern), .B0(n3126), .Y(n1698) );
  OAI32X1 U2973 ( .A0(n3127), .A1(n2498), .A2(n3128), .B0(n2916), .B1(n2990), 
        .Y(n3126) );
  CLKINVX1 U2974 ( .A(n2790), .Y(n2916) );
  OAI21XL U2975 ( .A0(n2736), .A1(n2738), .B0(n2734), .Y(n2790) );
  NOR4BBX1 U2976 ( .AN(n3761), .BN(n3579), .C(n3129), .D(n3130), .Y(n3128) );
  NAND3BX1 U2977 ( .AN(n3760), .B(n2501), .C(n3762), .Y(n3130) );
  NAND4X1 U2978 ( .A(n3554), .B(n3576), .C(n3577), .D(n3578), .Y(n3129) );
  NOR4X1 U2979 ( .A(n3131), .B(n3132), .C(n3133), .D(n3134), .Y(n3127) );
  MXI2X1 U2980 ( .A(n2350), .B(n2514), .S0(n3578), .Y(n3134) );
  XOR2X1 U2981 ( .A(n3762), .B(n2488), .Y(n3133) );
  NAND4X1 U2982 ( .A(n3135), .B(n3136), .C(n3137), .D(n3138), .Y(n3131) );
  XOR2X1 U2983 ( .A(n3579), .B(n2580), .Y(n3138) );
  XOR2X1 U2984 ( .A(n3554), .B(n2584), .Y(n3137) );
  XOR2X1 U2985 ( .A(n3760), .B(n2589), .Y(n3136) );
  XOR2X1 U2986 ( .A(n3761), .B(n2592), .Y(n3135) );
  OAI21XL U2987 ( .A0(n2052), .A1(ispattern), .B0(n3139), .Y(n1696) );
  NOR4BBX1 U2988 ( .AN(n3764), .BN(n3575), .C(n3142), .D(n3143), .Y(n3141) );
  NAND3BX1 U2989 ( .AN(n3763), .B(n2501), .C(n3765), .Y(n3143) );
  NAND4X1 U2990 ( .A(n3555), .B(n3572), .C(n3573), .D(n3574), .Y(n3142) );
  NOR4X1 U2991 ( .A(n3144), .B(n3145), .C(n3146), .D(n3147), .Y(n3140) );
  MXI2X1 U2992 ( .A(n2512), .B(n2514), .S0(n3574), .Y(n3147) );
  XOR2X1 U2993 ( .A(n3765), .B(n2488), .Y(n3146) );
  NAND4X1 U2994 ( .A(n3148), .B(n3149), .C(n3150), .D(n3151), .Y(n3144) );
  XOR2X1 U2995 ( .A(n3575), .B(n2580), .Y(n3151) );
  XOR2X1 U2996 ( .A(n3555), .B(n2584), .Y(n3150) );
  XOR2X1 U2997 ( .A(n3763), .B(n2589), .Y(n3149) );
  XOR2X1 U2998 ( .A(n3764), .B(n2592), .Y(n3148) );
  OAI21XL U2999 ( .A0(n2051), .A1(ispattern), .B0(n3152), .Y(n1694) );
  OAI32X1 U3000 ( .A0(n3153), .A1(n2498), .A2(n3154), .B0(n2821), .B1(n2990), 
        .Y(n3152) );
  NAND2X1 U3001 ( .A(star_index[2]), .B(n3102), .Y(n2821) );
  NAND2X1 U3002 ( .A(n2736), .B(n2738), .Y(n3102) );
  NOR4BBX1 U3003 ( .AN(n3767), .BN(n3571), .C(n3155), .D(n3156), .Y(n3154) );
  NAND3BX1 U3004 ( .AN(n3766), .B(n2501), .C(n3768), .Y(n3156) );
  NAND4X1 U3005 ( .A(n3556), .B(n3568), .C(n3569), .D(n3570), .Y(n3155) );
  NOR4X1 U3006 ( .A(n3157), .B(n3158), .C(n3159), .D(n3160), .Y(n3153) );
  MXI2X1 U3007 ( .A(n2350), .B(n2513), .S0(n3570), .Y(n3160) );
  XOR2X1 U3008 ( .A(n3768), .B(n2488), .Y(n3159) );
  NAND4X1 U3009 ( .A(n3161), .B(n3162), .C(n3163), .D(n3164), .Y(n3157) );
  XOR2X1 U3010 ( .A(n3571), .B(n2580), .Y(n3164) );
  XOR2X1 U3011 ( .A(n3556), .B(n2584), .Y(n3163) );
  XOR2X1 U3012 ( .A(n3766), .B(n2589), .Y(n3162) );
  XOR2X1 U3013 ( .A(n3767), .B(n2592), .Y(n3161) );
  OAI21XL U3014 ( .A0(n2050), .A1(ispattern), .B0(n3165), .Y(n1692) );
  OAI32X1 U3015 ( .A0(n3166), .A1(n2498), .A2(n3167), .B0(n2835), .B1(n2990), 
        .Y(n3165) );
  NOR4BBX1 U3016 ( .AN(n3770), .BN(n3567), .C(n3168), .D(n3169), .Y(n3167) );
  NAND3BX1 U3017 ( .AN(n3769), .B(n2501), .C(n3771), .Y(n3169) );
  NAND4X1 U3018 ( .A(n3557), .B(n3564), .C(n3565), .D(n3566), .Y(n3168) );
  NOR4X1 U3019 ( .A(n3170), .B(n3171), .C(n3172), .D(n3173), .Y(n3166) );
  MXI2X1 U3020 ( .A(n2350), .B(n2514), .S0(n3566), .Y(n3173) );
  XOR2X1 U3021 ( .A(n3771), .B(n2488), .Y(n3172) );
  NAND4X1 U3022 ( .A(n3174), .B(n3175), .C(n3176), .D(n3177), .Y(n3170) );
  XOR2X1 U3023 ( .A(n3567), .B(n2580), .Y(n3177) );
  XOR2X1 U3024 ( .A(n3557), .B(n2584), .Y(n3176) );
  XOR2X1 U3025 ( .A(n3769), .B(n2589), .Y(n3175) );
  XOR2X1 U3026 ( .A(n3770), .B(n2592), .Y(n3174) );
  OAI21XL U3027 ( .A0(n2049), .A1(ispattern), .B0(n3178), .Y(n1690) );
  OAI32X1 U3028 ( .A0(n3179), .A1(n2498), .A2(n3180), .B0(n2849), .B1(n2990), 
        .Y(n3178) );
  NAND2BX1 U3029 ( .AN(n2835), .B(star_index[0]), .Y(n2849) );
  NAND2X1 U3030 ( .A(star_index[1]), .B(star_index[2]), .Y(n2835) );
  NOR4BBX1 U3031 ( .AN(n3773), .BN(n3563), .C(n3181), .D(n3182), .Y(n3180) );
  NAND3BX1 U3032 ( .AN(n3772), .B(n2501), .C(n3774), .Y(n3182) );
  NAND4BX1 U3033 ( .AN(n2510), .B(n2511), .C(n2589), .D(n3183), .Y(n2613) );
  NOR4X1 U3034 ( .A(chardata[7]), .B(n2592), .C(n2584), .D(n2580), .Y(n3183)
         );
  NAND3X1 U3035 ( .A(n3184), .B(n2584), .C(n3185), .Y(n2722) );
  NOR3X1 U3036 ( .A(n2594), .B(n2589), .C(n2495), .Y(n3185) );
  NAND4X1 U3037 ( .A(n3558), .B(n3560), .C(n3561), .D(n3562), .Y(n3181) );
  NOR4X1 U3038 ( .A(n3187), .B(n3188), .C(n3189), .D(n3190), .Y(n3179) );
  MXI2X1 U3039 ( .A(n2511), .B(n2513), .S0(n3562), .Y(n3190) );
  CLKINVX1 U3040 ( .A(chardata[2]), .Y(n2619) );
  XOR2X1 U3041 ( .A(n3774), .B(n2488), .Y(n3189) );
  CLKINVX1 U3042 ( .A(chardata[7]), .Y(n2616) );
  CLKINVX1 U3043 ( .A(chardata[3]), .Y(n2618) );
  NAND4X1 U3044 ( .A(n3191), .B(n3192), .C(n3193), .D(n3194), .Y(n3187) );
  XOR2X1 U3045 ( .A(n3563), .B(chardata[1]), .Y(n3194) );
  XOR2X1 U3046 ( .A(n3558), .B(n2585), .Y(n3193) );
  XOR2X1 U3047 ( .A(n3772), .B(n2589), .Y(n3192) );
  XOR2X1 U3048 ( .A(n3773), .B(n2593), .Y(n3191) );
  AND2X1 U3049 ( .A(N544), .B(isstring), .Y(N922) );
  AND2X1 U3050 ( .A(N543), .B(isstring), .Y(N921) );
  AND2X1 U3051 ( .A(N542), .B(isstring), .Y(N920) );
  AND2X1 U3052 ( .A(N541), .B(isstring), .Y(N919) );
  AND2X1 U3053 ( .A(N540), .B(isstring), .Y(N918) );
  NOR3BXL U3054 ( .AN(n3195), .B(n2047), .C(n2577), .Y(N460) );
  NOR2X1 U3055 ( .A(n2577), .B(n3196), .Y(N459) );
  NOR2X1 U3056 ( .A(n2576), .B(n3197), .Y(N458) );
  NOR2X1 U3057 ( .A(n2577), .B(n3198), .Y(N457) );
  NOR2X1 U3058 ( .A(n2577), .B(n3199), .Y(N456) );
  NOR2X1 U3059 ( .A(n2576), .B(n3200), .Y(N455) );
  NOR2X1 U3060 ( .A(n2576), .B(n3201), .Y(N454) );
  NOR2X1 U3061 ( .A(n2576), .B(n3202), .Y(N453) );
  NOR2X1 U3062 ( .A(n2576), .B(n3203), .Y(N452) );
  NOR2X1 U3063 ( .A(n2576), .B(n3204), .Y(N451) );
  NOR2X1 U3064 ( .A(n2576), .B(n3205), .Y(N450) );
  NOR2X1 U3065 ( .A(n2576), .B(n3206), .Y(N449) );
  NOR2X1 U3066 ( .A(n2576), .B(n3208), .Y(N447) );
  NOR2X1 U3067 ( .A(n2576), .B(n3209), .Y(N446) );
  NOR2X1 U3068 ( .A(n2576), .B(n3211), .Y(N444) );
  NOR2X1 U3069 ( .A(n2576), .B(n3212), .Y(N443) );
  NOR2X1 U3070 ( .A(n2576), .B(n3214), .Y(N441) );
  NOR2X1 U3071 ( .A(n2575), .B(n3215), .Y(N440) );
  NOR2X1 U3072 ( .A(n2575), .B(n3216), .Y(N439) );
  NOR2X1 U3073 ( .A(n2575), .B(n3217), .Y(N438) );
  NOR2X1 U3074 ( .A(n2575), .B(n3219), .Y(N436) );
  NOR2X1 U3075 ( .A(n2575), .B(n3222), .Y(N433) );
  NOR2X1 U3076 ( .A(n2575), .B(n3223), .Y(N432) );
  NOR2X1 U3077 ( .A(n2575), .B(n3225), .Y(N430) );
  NOR2X1 U3078 ( .A(n2575), .B(n3226), .Y(N429) );
  NOR2X1 U3079 ( .A(n2575), .B(n3228), .Y(N427) );
  XOR2X1 U3080 ( .A(count_pat[3]), .B(n3231), .Y(n3230) );
  NAND2X1 U3081 ( .A(n3232), .B(count_pat[2]), .Y(n3231) );
  XOR2X1 U3082 ( .A(n2082), .B(n3232), .Y(n3233) );
  NOR2X1 U3083 ( .A(n1373), .B(n2083), .Y(n3232) );
  AOI211X1 U3084 ( .A0(n3235), .A1(n3236), .B0(n3237), .C0(n2740), .Y(N254) );
  AOI211X1 U3085 ( .A0(n2385), .A1(n3195), .B0(n3238), .C0(n3239), .Y(n2740)
         );
  OAI2BB1X1 U3086 ( .A0N(n3779), .A1N(n3240), .B0(n2515), .Y(n3195) );
  OAI31XL U3087 ( .A0(n2485), .A1(n1373), .A2(n2452), .B0(n2438), .Y(n3240) );
  OAI31XL U3088 ( .A0(n3244), .A1(count_pat[3]), .A2(count_pat[2]), .B0(n3228), 
        .Y(n3242) );
  OAI211X1 U3089 ( .A0(n2724), .A1(n3245), .B0(n3246), .C0(n3247), .Y(n3236)
         );
  OAI2BB1X1 U3090 ( .A0N(n2724), .A1N(n3245), .B0(n2369), .Y(n3247) );
  OAI222XL U3091 ( .A0(match_index_ns[3]), .A1(n2369), .B0(match_index_ns[2]), 
        .B1(n2388), .C0(n3248), .C1(n3249), .Y(n3246) );
  NOR2X1 U3092 ( .A(string_length[1]), .B(n2726), .Y(n3249) );
  AOI211X1 U3093 ( .A0(string_length[1]), .A1(n2726), .B0(string_length[0]), 
        .C0(n2727), .Y(n3248) );
  NAND2X1 U3094 ( .A(string_length[4]), .B(n2723), .Y(n3235) );
  OAI22XL U3095 ( .A0(n3526), .A1(n2719), .B0(n2723), .B1(n3250), .Y(N204) );
  CLKINVX1 U3096 ( .A(match_index_ns[4]), .Y(n2723) );
  NAND4X1 U3097 ( .A(n3251), .B(n3252), .C(n3253), .D(n3254), .Y(
        match_index_ns[4]) );
  OAI21XL U3098 ( .A0(n3202), .A1(n2434), .B0(n3260), .Y(n3256) );
  OAI21XL U3099 ( .A0(n3266), .A1(n3267), .B0(n3268), .Y(n3251) );
  OAI22XL U3100 ( .A0(n3525), .A1(n2719), .B0(n2724), .B1(n3250), .Y(N203) );
  CLKINVX1 U3101 ( .A(match_index_ns[3]), .Y(n2724) );
  OAI211X1 U3102 ( .A0(n3269), .A1(n2721), .B0(n3270), .C0(n3271), .Y(
        match_index_ns[3]) );
  CLKINVX1 U3103 ( .A(n3276), .Y(n3269) );
  OAI22XL U3104 ( .A0(n3524), .A1(n2719), .B0(n2725), .B1(n3250), .Y(N202) );
  NAND3X1 U3105 ( .A(n3277), .B(n3270), .C(n3278), .Y(match_index_ns[2]) );
  CLKINVX1 U3106 ( .A(n3285), .Y(n3284) );
  MXI2X1 U3107 ( .A(n3276), .B(n3287), .S0(n3780), .Y(n3277) );
  OAI22XL U3108 ( .A0(n3523), .A1(n2719), .B0(n2726), .B1(n3250), .Y(N201) );
  CLKINVX1 U3109 ( .A(match_index_ns[1]), .Y(n2726) );
  NAND4X1 U3110 ( .A(n3288), .B(n3289), .C(n3290), .D(n3291), .Y(
        match_index_ns[1]) );
  AOI211X1 U3111 ( .A0(n3780), .A1(n3292), .B0(n3293), .C0(n3294), .Y(n3291)
         );
  NAND2X1 U3112 ( .A(n3197), .B(n3196), .Y(n3238) );
  CLKINVX1 U3113 ( .A(n3265), .Y(n3196) );
  OAI22XL U3114 ( .A0(n3522), .A1(n2719), .B0(n2727), .B1(n3250), .Y(N200) );
  NAND2X1 U3115 ( .A(n3527), .B(n2719), .Y(n3250) );
  AOI222XL U3116 ( .A0(n3274), .A1(n3305), .B0(n3228), .B1(n3306), .C0(n3283), 
        .C1(n3307), .Y(n3304) );
  OAI21XL U3117 ( .A0(n3308), .A1(n3309), .B0(n3227), .Y(n3306) );
  NOR4BBX1 U3118 ( .AN(n3310), .BN(n3298), .C(n3286), .D(n3311), .Y(n3260) );
  OAI222XL U3119 ( .A0(n3259), .A1(n3211), .B0(n3239), .B1(n3197), .C0(n2434), 
        .C1(n3203), .Y(n3311) );
  NOR3X1 U3120 ( .A(n3273), .B(n3199), .C(n2434), .Y(n3286) );
  CLKINVX1 U3121 ( .A(n3312), .Y(n3199) );
  NAND2X1 U3122 ( .A(n3313), .B(n3314), .Y(n3298) );
  AOI21X1 U3123 ( .A0(n3268), .A1(n3315), .B0(n3297), .Y(n3310) );
  CLKINVX1 U3124 ( .A(n3316), .Y(n3201) );
  OAI21XL U3125 ( .A0(n3205), .A1(n3266), .B0(n3207), .Y(n3315) );
  CLKINVX1 U3126 ( .A(n3322), .Y(n3222) );
  NAND4X1 U3127 ( .A(n3325), .B(n3326), .C(n3327), .D(n3328), .Y(n3292) );
  NOR2BX1 U3128 ( .AN(n3264), .B(n3198), .Y(n3263) );
  CLKINVX1 U3129 ( .A(n3329), .Y(n3203) );
  CLKINVX1 U3130 ( .A(n3307), .Y(n3215) );
  CLKINVX1 U3131 ( .A(n3330), .Y(n3268) );
  OAI31XL U3132 ( .A0(n3276), .A1(n3255), .A2(n3287), .B0(n2721), .Y(n3299) );
  NAND3X1 U3133 ( .A(n3333), .B(n3262), .C(n3334), .Y(n3287) );
  CLKINVX1 U3134 ( .A(n3335), .Y(n3296) );
  CLKINVX1 U3135 ( .A(n3317), .Y(n3274) );
  OAI33X1 U3136 ( .A0(n3330), .A1(n3204), .A2(n3279), .B0(n3340), .B1(n3220), 
        .B2(n3281), .Y(n3276) );
  CLKINVX1 U3137 ( .A(n3341), .Y(n3281) );
  CLKINVX1 U3138 ( .A(n3267), .Y(n3204) );
  NAND2X1 U3139 ( .A(n3197), .B(n3265), .Y(n3301) );
  AO22X1 U3140 ( .A0(n2517), .A1(n2368), .B0(n3781), .B1(n3342), .Y(n3265) );
  OAI22XL U3141 ( .A0(n2048), .A1(n2438), .B0(n2485), .B1(n3343), .Y(n3342) );
  AOI22X1 U3142 ( .A0(n3782), .A1(n3344), .B0(n2517), .B1(n2384), .Y(n3197) );
  OAI22XL U3143 ( .A0(n2049), .A1(n2438), .B0(n2485), .B1(n3345), .Y(n3344) );
  AOI2BB2X1 U3144 ( .B0(n3783), .B1(n3346), .A0N(n2516), .A1N(n2050), .Y(n3198) );
  OAI22XL U3145 ( .A0(n2050), .A1(n2438), .B0(n2485), .B1(n3347), .Y(n3346) );
  NOR3X1 U3146 ( .A(n3312), .B(n3273), .C(n2434), .Y(n3264) );
  NOR2BX1 U3147 ( .AN(n3332), .B(n3210), .Y(n3313) );
  AOI221XL U3148 ( .A0(n3349), .A1(n3350), .B0(n3351), .B1(n2360), .C0(n3352), 
        .Y(n3348) );
  OAI222XL U3149 ( .A0(n2487), .A1(n3354), .B0(n2484), .B1(n3347), .C0(n2486), 
        .C1(n3357), .Y(n3352) );
  NAND3X1 U3150 ( .A(n3283), .B(n3339), .C(n3212), .Y(n3259) );
  OA22X1 U3151 ( .A0(n2064), .A1(n2516), .B0(n3359), .B1(n1352), .Y(n3212) );
  AOI221XL U3152 ( .A0(n3350), .A1(n3360), .B0(n3351), .B1(n2354), .C0(n3361), 
        .Y(n3359) );
  OAI222XL U3153 ( .A0(n3362), .A1(n2487), .B0(n3363), .B1(n2484), .C0(n3364), 
        .C1(n2486), .Y(n3361) );
  AO22X1 U3154 ( .A0(n2517), .A1(n2372), .B0(n3784), .B1(n3366), .Y(n3307) );
  OAI22XL U3155 ( .A0(n2067), .A1(n2438), .B0(n3367), .B1(n3368), .Y(n3366) );
  AOI221XL U3156 ( .A0(n3369), .A1(n3370), .B0(n3371), .B1(n3372), .C0(n3373), 
        .Y(n3367) );
  OAI22XL U3157 ( .A0(n3374), .A1(n3375), .B0(n3376), .B1(n3377), .Y(n3373) );
  AOI221XL U3158 ( .A0(n3379), .A1(n3350), .B0(n3351), .B1(n2370), .C0(n3380), 
        .Y(n3378) );
  OAI222XL U3159 ( .A0(n2487), .A1(n3381), .B0(n2484), .B1(n3382), .C0(n2486), 
        .C1(n3383), .Y(n3380) );
  CLKINVX1 U3160 ( .A(n3384), .Y(n3379) );
  AOI221XL U3161 ( .A0(n3386), .A1(n3350), .B0(n3351), .B1(n2357), .C0(n3387), 
        .Y(n3385) );
  OAI222XL U3162 ( .A0(n2487), .A1(n3357), .B0(n2484), .B1(n3354), .C0(n2486), 
        .C1(n3358), .Y(n3387) );
  NOR2X1 U3163 ( .A(n3305), .B(n3218), .Y(n3323) );
  AOI221XL U3164 ( .A0(n3390), .A1(n3350), .B0(n3351), .B1(n2356), .C0(n3391), 
        .Y(n3389) );
  OAI222XL U3165 ( .A0(n2487), .A1(n3358), .B0(n2484), .B1(n3357), .C0(n2486), 
        .C1(n3388), .Y(n3391) );
  CLKINVX1 U3166 ( .A(n3392), .Y(n3390) );
  AO22X1 U3167 ( .A0(n2517), .A1(n2373), .B0(n3785), .B1(n3393), .Y(n3305) );
  OAI22XL U3168 ( .A0(n2071), .A1(n2438), .B0(n3394), .B1(n3368), .Y(n3393) );
  AOI221XL U3169 ( .A0(n3371), .A1(n3370), .B0(n3395), .B1(n3372), .C0(n3396), 
        .Y(n3394) );
  OAI22XL U3170 ( .A0(n3375), .A1(n3377), .B0(n3376), .B1(n3397), .Y(n3396) );
  OAI22XL U3171 ( .A0(n2068), .A1(n2515), .B0(n3399), .B1(n1356), .Y(n3338) );
  AOI221XL U3172 ( .A0(n3400), .A1(n3350), .B0(n3351), .B1(n2355), .C0(n3401), 
        .Y(n3399) );
  OAI222XL U3173 ( .A0(n2487), .A1(n3364), .B0(n2484), .B1(n3362), .C0(n2486), 
        .C1(n3365), .Y(n3401) );
  OAI22XL U3174 ( .A0(n2069), .A1(n2515), .B0(n3402), .B1(n1349), .Y(n3324) );
  AOI221XL U3175 ( .A0(n3403), .A1(n3350), .B0(n3351), .B1(n2371), .C0(n3404), 
        .Y(n3402) );
  OAI222XL U3176 ( .A0(n2487), .A1(n3383), .B0(n2484), .B1(n3381), .C0(n2486), 
        .C1(n3384), .Y(n3404) );
  CLKINVX1 U3177 ( .A(n3405), .Y(n3403) );
  AOI2BB2X1 U3178 ( .B0(n3790), .B1(n3406), .A0N(n2516), .A1N(n2079), .Y(n3227) );
  OAI22XL U3179 ( .A0(n2079), .A1(n2438), .B0(n3407), .B1(n3368), .Y(n3406) );
  AOI221XL U3180 ( .A0(n3408), .A1(n3372), .B0(n3395), .B1(n3409), .C0(n3410), 
        .Y(n3407) );
  OAI22XL U3181 ( .A0(n3411), .A1(n3412), .B0(n3375), .B1(n3398), .Y(n3410) );
  MXI3X1 U3182 ( .A(n2078), .B(n2079), .C(n3414), .S0(n3520), .S1(n2452), .Y(
        n3408) );
  AO22X1 U3183 ( .A0(n2517), .A1(n2381), .B0(n3788), .B1(n3415), .Y(n3309) );
  OAI22XL U3184 ( .A0(n2078), .A1(n2438), .B0(n3416), .B1(n3368), .Y(n3415) );
  AOI221XL U3185 ( .A0(n3372), .A1(n3417), .B0(n3418), .B1(n3370), .C0(n3419), 
        .Y(n3416) );
  OAI22XL U3186 ( .A0(n3375), .A1(n3388), .B0(n3376), .B1(n3392), .Y(n3419) );
  OAI222XL U3187 ( .A0(n2075), .A1(n2518), .B0(n2076), .B1(n2520), .C0(n2452), 
        .C1(n3420), .Y(n3417) );
  OAI22XL U3188 ( .A0(n2080), .A1(n2438), .B0(n3422), .B1(n3368), .Y(n3421) );
  AOI221XL U3189 ( .A0(n3423), .A1(n3372), .B0(n3424), .B1(n3409), .C0(n3425), 
        .Y(n3422) );
  OAI22XL U3190 ( .A0(n3411), .A1(n3426), .B0(n3375), .B1(n3427), .Y(n3425) );
  MXI2X1 U3191 ( .A(n2381), .B(n2364), .S0(N208), .Y(n3420) );
  AO22X1 U3192 ( .A0(n2517), .A1(n2364), .B0(n3787), .B1(n3428), .Y(n3295) );
  OAI22XL U3193 ( .A0(n2077), .A1(n2438), .B0(n3429), .B1(n3368), .Y(n3428) );
  AOI221XL U3194 ( .A0(n3372), .A1(n3430), .B0(n3431), .B1(n3370), .C0(n3432), 
        .Y(n3429) );
  OAI22XL U3195 ( .A0(n3375), .A1(n3384), .B0(n3376), .B1(n3405), .Y(n3432) );
  OAI222XL U3196 ( .A0(n2074), .A1(n2518), .B0(n2075), .B1(n2520), .C0(n2452), 
        .C1(n3414), .Y(n3430) );
  MXI2X1 U3197 ( .A(n2364), .B(n2376), .S0(N208), .Y(n3414) );
  AOI221XL U3198 ( .A0(n3434), .A1(n3350), .B0(n3351), .B1(n2376), .C0(n3435), 
        .Y(n3433) );
  OAI222XL U3199 ( .A0(n2487), .A1(n3427), .B0(n2484), .B1(n3365), .C0(n2486), 
        .C1(n3436), .Y(n3435) );
  CLKINVX1 U3200 ( .A(n3426), .Y(n3434) );
  OAI221XL U3201 ( .A0(n2523), .A1(n2376), .B0(n2525), .B1(n2359), .C0(n3437), 
        .Y(n3426) );
  NOR3X1 U3202 ( .A(n3322), .B(n3221), .C(n3331), .Y(n3341) );
  OAI22XL U3203 ( .A0(n2075), .A1(n2515), .B0(n3438), .B1(n1340), .Y(n3331) );
  AOI221XL U3204 ( .A0(n3439), .A1(n3350), .B0(n3351), .B1(n2359), .C0(n3440), 
        .Y(n3438) );
  OAI222XL U3205 ( .A0(n2487), .A1(n3398), .B0(n3397), .B1(n2484), .C0(n2486), 
        .C1(n3413), .Y(n3440) );
  OAI221XL U3206 ( .A0(n2523), .A1(n2373), .B0(n2524), .B1(n2356), .C0(n3441), 
        .Y(n3413) );
  CLKINVX1 U3207 ( .A(n3412), .Y(n3439) );
  OAI221XL U3208 ( .A0(n2523), .A1(n2359), .B0(n2524), .B1(n2375), .C0(n3443), 
        .Y(n3412) );
  AOI221XL U3209 ( .A0(n3431), .A1(n3350), .B0(n3351), .B1(n2358), .C0(n3445), 
        .Y(n3444) );
  OAI222XL U3210 ( .A0(n2487), .A1(n3384), .B0(n2484), .B1(n3383), .C0(n2486), 
        .C1(n3405), .Y(n3445) );
  OAI221XL U3211 ( .A0(n2523), .A1(n2358), .B0(n2524), .B1(n2352), .C0(n3449), 
        .Y(n3448) );
  AOI221XL U3212 ( .A0(n3418), .A1(n3350), .B0(n3351), .B1(n2375), .C0(n3451), 
        .Y(n3450) );
  OA22X1 U3213 ( .A0(n2518), .A1(n2374), .B0(n2520), .B1(n2354), .Y(n3454) );
  OAI221XL U3214 ( .A0(n2523), .A1(n2375), .B0(n2524), .B1(n2358), .C0(n3456), 
        .Y(n3455) );
  AOI22X1 U3215 ( .A0(n3786), .A1(n3457), .B0(n2517), .B1(n2352), .Y(n3220) );
  OAI22XL U3216 ( .A0(n2072), .A1(n2438), .B0(n3458), .B1(n3368), .Y(n3457) );
  AOI221XL U3217 ( .A0(n3400), .A1(n3370), .B0(n3424), .B1(n3372), .C0(n3459), 
        .Y(n3458) );
  OAI22XL U3218 ( .A0(n3375), .A1(n3364), .B0(n3376), .B1(n3365), .Y(n3459) );
  OAI221XL U3219 ( .A0(n2523), .A1(n2352), .B0(n2525), .B1(n2373), .C0(n3461), 
        .Y(n3436) );
  CLKINVX1 U3220 ( .A(n3427), .Y(n3400) );
  AOI2BB2X1 U3221 ( .B0(n3791), .B1(n3463), .A0N(n2516), .A1N(n2063), .Y(n3211) );
  OAI22XL U3222 ( .A0(n2063), .A1(n2438), .B0(n3464), .B1(n3368), .Y(n3463) );
  AOI221XL U3223 ( .A0(n3370), .A1(n3465), .B0(n3372), .B1(n3369), .C0(n3466), 
        .Y(n3464) );
  OAI22XL U3224 ( .A0(n3467), .A1(n3375), .B0(n3374), .B1(n3376), .Y(n3466) );
  NAND2X1 U3225 ( .A(n3468), .B(n3469), .Y(n3376) );
  CLKINVX1 U3226 ( .A(n3411), .Y(n3370) );
  AOI221XL U3227 ( .A0(n3350), .A1(n3473), .B0(n3351), .B1(n2361), .C0(n3474), 
        .Y(n3472) );
  CLKINVX1 U3228 ( .A(n3314), .Y(n3209) );
  OAI22XL U3229 ( .A0(n2061), .A1(n2516), .B0(n3476), .B1(n1357), .Y(n3314) );
  AOI221XL U3230 ( .A0(n3477), .A1(n3350), .B0(n3351), .B1(n2378), .C0(n3478), 
        .Y(n3476) );
  OAI222XL U3231 ( .A0(n2487), .A1(n3382), .B0(n2484), .B1(n3345), .C0(n2486), 
        .C1(n3381), .Y(n3478) );
  CLKINVX1 U3232 ( .A(n3300), .Y(n3205) );
  OAI22XL U3233 ( .A0(n2057), .A1(n2516), .B0(n3481), .B1(n1366), .Y(n3300) );
  AOI221XL U3234 ( .A0(n3482), .A1(n3483), .B0(n3484), .B1(n3485), .C0(n3486), 
        .Y(n3481) );
  OAI22XL U3235 ( .A0(n2057), .A1(n2438), .B0(n2485), .B1(n3381), .Y(n3486) );
  OA22X1 U3236 ( .A0(n2365), .A1(n2519), .B0(n2379), .B1(n2520), .Y(n3487) );
  AOI2BB2X1 U3237 ( .B0(n2377), .B1(n2517), .A0N(n3488), .A1N(n1368), .Y(n3207) );
  AOI221XL U3238 ( .A0(n3479), .A1(n3489), .B0(n3351), .B1(n2377), .C0(n3490), 
        .Y(n3488) );
  OAI22XL U3239 ( .A0(n3377), .A1(n2485), .B0(n3374), .B1(n2486), .Y(n3490) );
  AOI221XL U3240 ( .A0(n3493), .A1(n3483), .B0(n3494), .B1(n3485), .C0(n3495), 
        .Y(n3492) );
  OAI22XL U3241 ( .A0(n2058), .A1(n2438), .B0(n2485), .B1(n3357), .Y(n3495) );
  AOI221XL U3242 ( .A0(n3498), .A1(n3483), .B0(n3485), .B1(n3499), .C0(n3500), 
        .Y(n3497) );
  OAI22XL U3243 ( .A0(n2056), .A1(n2438), .B0(n3362), .B1(n2485), .Y(n3500) );
  OA22X1 U3244 ( .A0(n2382), .A1(n2518), .B0(n2365), .B1(n2521), .Y(n3501) );
  NAND2X1 U3245 ( .A(n3336), .B(n3200), .Y(n3273) );
  CLKINVX1 U3246 ( .A(n3337), .Y(n3200) );
  OAI22XL U3247 ( .A0(n2052), .A1(n2516), .B0(n3502), .B1(n1361), .Y(n3337) );
  AOI222XL U3248 ( .A0(n3351), .A1(n2366), .B0(n3498), .B1(n3485), .C0(n3350), 
        .C1(n3499), .Y(n3502) );
  CLKINVX1 U3249 ( .A(n3343), .Y(n3498) );
  AOI222XL U3250 ( .A0(n3351), .A1(n2365), .B0(n3493), .B1(n3485), .C0(n3494), 
        .C1(n3350), .Y(n3506) );
  OAI22XL U3251 ( .A0(n2053), .A1(n2516), .B0(n3509), .B1(n1362), .Y(n3316) );
  AOI222XL U3252 ( .A0(n3351), .A1(n2382), .B0(n3482), .B1(n3485), .C0(n3484), 
        .C1(n3350), .Y(n3509) );
  OAI21XL U3253 ( .A0(n1373), .A1(n2047), .B0(n2452), .Y(n3511) );
  OAI22XL U3254 ( .A0(n2055), .A1(n2516), .B0(n3512), .B1(n1364), .Y(n3329) );
  AOI221XL U3255 ( .A0(n3513), .A1(n3483), .B0(n3485), .B1(n3514), .C0(n3515), 
        .Y(n3512) );
  OAI22XL U3256 ( .A0(n2055), .A1(n2438), .B0(n3374), .B1(n2485), .Y(n3515) );
  CLKINVX1 U3257 ( .A(n2486), .Y(n3485) );
  NOR2BX1 U3258 ( .AN(n3468), .B(n3368), .Y(n3479) );
  NOR2BX1 U3259 ( .AN(N211), .B(N212), .Y(n3468) );
  OAI22XL U3260 ( .A0(n2051), .A1(n2515), .B0(n3518), .B1(n1370), .Y(n3312) );
  CLKINVX1 U3261 ( .A(n3467), .Y(n3514) );
  OAI221XL U3262 ( .A0(n2522), .A1(n2383), .B0(n2524), .B1(n2367), .C0(n3519), 
        .Y(n3467) );
  CLKINVX1 U3263 ( .A(n2452), .Y(n3505) );
  CLKINVX1 U3264 ( .A(N208), .Y(n3520) );
  NAND4X1 U3265 ( .A(n3184), .B(n2589), .C(n2586), .D(n2595), .Y(n3186) );
  CLKINVX1 U3266 ( .A(n3244), .Y(n3234) );
  NAND2X1 U3267 ( .A(n1373), .B(n2083), .Y(n3244) );
  NOR2X1 U3268 ( .A(N211), .B(N212), .Y(n3471) );
endmodule

