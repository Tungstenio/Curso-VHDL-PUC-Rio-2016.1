/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso_de_Extensao_VHDL/Aulas/Aula 10/Material_aula10/SOMADOR_FLOAT/PIPELINED_FLOAT_ADDER_TM.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);


static void work_a_3469855778_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;

LAB0:    xsi_set_current_line(164, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 12416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(165, ng0);
    t1 = xsi_get_transient_memory(24U);
    memset(t1, 0, 24U);
    t5 = t1;
    memset(t5, (unsigned char)2, 24U);
    t6 = (t0 + 12784);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 24U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(166, ng0);
    t1 = xsi_get_transient_memory(24U);
    memset(t1, 0, 24U);
    t2 = t1;
    memset(t2, (unsigned char)2, 24U);
    t5 = (t0 + 12848);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 24U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(167, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 12912);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(168, ng0);
    t1 = (t0 + 12976);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(169, ng0);
    t1 = xsi_get_transient_memory(24U);
    memset(t1, 0, 24U);
    t2 = t1;
    memset(t2, (unsigned char)2, 24U);
    t5 = (t0 + 13040);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 24U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_set_current_line(171, ng0);
    t2 = (t0 + 3912U);
    t6 = *((char **)t2);
    t2 = (t0 + 12784);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 24U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(172, ng0);
    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    t1 = (t0 + 12848);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 24U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(173, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 12912);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(174, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 12976);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(175, ng0);
    t1 = (t0 + 5512U);
    t2 = *((char **)t1);
    t1 = (t0 + 13040);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 24U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

}

static void work_a_3469855778_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(179, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t1 = (t0 + 23848U);
    t3 = (t0 + 3592U);
    t4 = *((char **)t3);
    t3 = (t0 + 23864U);
    t5 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB3;

LAB4:
LAB5:    t11 = (t0 + 13104);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 12432);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t6 = (t0 + 13104);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_2(char *t0)
{
    char t16[16];
    char t21[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    xsi_set_current_line(180, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 1672U);
    t9 = *((char **)t8);
    t10 = (31 - 31);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t17 = ((IEEE_P_2592010699) + 4024);
    t15 = xsi_base_array_concat(t15, t16, t17, (char)99, t7, (char)99, t14, (char)101);
    t18 = (t0 + 4392U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t22 = ((IEEE_P_2592010699) + 4024);
    t18 = xsi_base_array_concat(t18, t21, t22, (char)97, t15, t16, (char)99, t20, (char)101);
    t23 = (1U + 1U);
    t24 = (t23 + 1U);
    t25 = (3U != t24);
    if (t25 == 1)
        goto LAB5;

LAB6:    t26 = (t0 + 13168);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t18, 3U);
    xsi_driver_first_trans_fast(t26);

LAB2:    t31 = (t0 + 12448);
    *((int *)t31) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(3U, t24, 0);
    goto LAB6;

}

static void work_a_3469855778_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 8376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t2 = (t0 + 24390);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 24393);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 3432U);
    t3 = *((char **)t2);
    t2 = (t0 + 13232);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 24U);
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(182, ng0);

LAB13:    t2 = (t0 + 12464);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(183, ng0);
    t9 = (t0 + 3592U);
    t10 = *((char **)t9);
    t9 = (t0 + 13232);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 24U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB6:    xsi_set_current_line(183, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t2 = (t0 + 13232);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 24U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 12464);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3469855778_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 8624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(187, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t2 = (t0 + 24396);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 24399);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 3592U);
    t3 = *((char **)t2);
    t2 = (t0 + 13296);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 24U);
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(187, ng0);

LAB13:    t2 = (t0 + 12480);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(188, ng0);
    t9 = (t0 + 3432U);
    t10 = *((char **)t9);
    t9 = (t0 + 13296);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 24U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB6:    xsi_set_current_line(188, ng0);
    t2 = (t0 + 3432U);
    t3 = *((char **)t2);
    t2 = (t0 + 13296);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 24U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 12480);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3469855778_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    int t11;
    char *t12;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 8872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(192, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t2 = (t0 + 24402);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB10:    t6 = (t0 + 24405);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB11:    t9 = (t0 + 24408);
    t11 = xsi_mem_cmp(t9, t3, 3U);
    if (t11 == 1)
        goto LAB7;

LAB12:    t12 = (t0 + 24411);
    t14 = xsi_mem_cmp(t12, t3, 3U);
    if (t14 == 1)
        goto LAB8;

LAB13:
LAB9:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 13360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(192, ng0);

LAB17:    t2 = (t0 + 12496);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB5:    xsi_set_current_line(193, ng0);
    t15 = (t0 + 13360);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);
    goto LAB4;

LAB6:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 13360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 13360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB8:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 13360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB14:;
LAB15:    t3 = (t0 + 12496);
    *((int *)t3) = 0;
    goto LAB2;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

}

static void work_a_3469855778_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 9120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(199, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t4 = (2 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 24414);
    t9 = xsi_mem_cmp(t7, t2, 2U);
    if (t9 == 1)
        goto LAB5;

LAB8:    t10 = (t0 + 24416);
    t12 = xsi_mem_cmp(t10, t2, 2U);
    if (t12 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 13424);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(199, ng0);

LAB13:    t2 = (t0 + 12512);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(200, ng0);
    t13 = (t0 + 13424);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast(t13);
    goto LAB4;

LAB6:    xsi_set_current_line(200, ng0);
    t2 = (t0 + 13424);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 12512);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3469855778_3212880686_p_7(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 9368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 4232U);
    t3 = *((char **)t2);
    t4 = (2 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 24418);
    t9 = xsi_mem_cmp(t7, t2, 2U);
    if (t9 == 1)
        goto LAB5;

LAB8:    t10 = (t0 + 24420);
    t12 = xsi_mem_cmp(t10, t2, 2U);
    if (t12 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 13488);
    t3 = (t2 + 56U);
    t7 = *((char **)t3);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);

LAB4:    xsi_set_current_line(204, ng0);

LAB13:    t2 = (t0 + 12528);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(205, ng0);
    t13 = (t0 + 5032U);
    t14 = *((char **)t13);
    t15 = *((unsigned char *)t14);
    t13 = (t0 + 13488);
    t16 = (t13 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = t15;
    xsi_driver_first_trans_fast(t13);
    goto LAB4;

LAB6:    xsi_set_current_line(205, ng0);
    t2 = (t0 + 5032U);
    t3 = *((char **)t2);
    t15 = *((unsigned char *)t3);
    t2 = (t0 + 13488);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t15;
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 12528);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3469855778_3212880686_p_8(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(209, ng0);
    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t1 = (t0 + 23976U);
    t3 = (t0 + 24422);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 23;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (23 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 13552);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 12544);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 13552);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_9(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(210, ng0);

LAB3:    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5192U);
    t4 = *((char **)t1);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t0 + 23976U);
    t1 = xsi_base_array_concat(t1, t5, t6, (char)99, t3, (char)97, t4, t7, (char)101);
    t8 = (1U + 24U);
    t9 = (25U != t8);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 13616);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 25U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t15 = (t0 + 12560);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(25U, t8, 0);
    goto LAB6;

}

static void work_a_3469855778_3212880686_p_10(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(212, ng0);

LAB3:    t1 = (t0 + 6312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4872U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 13680);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 12576);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_11(char *t0)
{
    char t9[16];
    char t19[16];
    char t23[16];
    char t24[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t10;
    char *t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int t20;
    unsigned int t21;
    unsigned int t22;
    int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 10360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(213, ng0);
    t2 = (t0 + 6472U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(213, ng0);

LAB13:    t2 = (t0 + 12592);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(214, ng0);
    t5 = (t0 + 5672U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t5 = (t0 + 6152U);
    t8 = *((char **)t5);
    t10 = ((IEEE_P_2592010699) + 4024);
    t11 = (t0 + 24024U);
    t5 = xsi_base_array_concat(t5, t9, t10, (char)99, t7, (char)97, t8, t11, (char)101);
    t12 = (1U + 31U);
    t13 = (32U != t12);
    if (t13 == 1)
        goto LAB7;

LAB8:    t14 = (t0 + 13744);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB4;

LAB6:    xsi_set_current_line(214, ng0);
    t2 = (t0 + 24446);
    t6 = ((IEEE_P_2592010699) + 4024);
    t8 = (t19 + 0U);
    t10 = (t8 + 0U);
    *((int *)t10) = 0;
    t10 = (t8 + 4U);
    *((int *)t10) = 7;
    t10 = (t8 + 8U);
    *((int *)t10) = 1;
    t20 = (7 - 0);
    t12 = (t20 * 1);
    t12 = (t12 + 1);
    t10 = (t8 + 12U);
    *((unsigned int *)t10) = t12;
    t5 = xsi_base_array_concat(t5, t9, t6, (char)99, (unsigned char)2, (char)97, t2, t19, (char)101);
    t10 = (t0 + 6152U);
    t11 = *((char **)t10);
    t12 = (30 - 22);
    t21 = (t12 * 1U);
    t22 = (0 + t21);
    t10 = (t11 + t22);
    t15 = ((IEEE_P_2592010699) + 4024);
    t16 = (t24 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 22;
    t17 = (t16 + 4U);
    *((int *)t17) = 0;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t25 = (0 - 22);
    t26 = (t25 * -1);
    t26 = (t26 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t26;
    t14 = xsi_base_array_concat(t14, t23, t15, (char)97, t5, t9, (char)97, t10, t24, (char)101);
    t26 = (1U + 8U);
    t27 = (t26 + 23U);
    t4 = (32U != t27);
    if (t4 == 1)
        goto LAB9;

LAB10:    t17 = (t0 + 13744);
    t18 = (t17 + 56U);
    t28 = *((char **)t18);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memcpy(t30, t14, 32U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB4;

LAB7:    xsi_size_not_matching(32U, t12, 0);
    goto LAB8;

LAB9:    xsi_size_not_matching(32U, t27, 0);
    goto LAB10;

LAB11:    t3 = (t0 + 12592);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3469855778_3212880686_p_12(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(218, ng0);

LAB3:    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 13808);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 12608);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_13(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(219, ng0);

LAB3:    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t1 = (t0 + 13872);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 3U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 12624);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_14(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(220, ng0);

LAB3:    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    t1 = (t0 + 13936);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 24U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 12640);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_15(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(221, ng0);

LAB3:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t1 = (t0 + 14000);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 24U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 12656);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_16(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(222, ng0);

LAB3:    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t1 = (t0 + 14064);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 24U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 12672);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_17(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(223, ng0);

LAB3:    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 14128);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 12688);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3469855778_3212880686_p_18(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(224, ng0);

LAB3:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 14192);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 12704);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3469855778_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3469855778_3212880686_p_0,(void *)work_a_3469855778_3212880686_p_1,(void *)work_a_3469855778_3212880686_p_2,(void *)work_a_3469855778_3212880686_p_3,(void *)work_a_3469855778_3212880686_p_4,(void *)work_a_3469855778_3212880686_p_5,(void *)work_a_3469855778_3212880686_p_6,(void *)work_a_3469855778_3212880686_p_7,(void *)work_a_3469855778_3212880686_p_8,(void *)work_a_3469855778_3212880686_p_9,(void *)work_a_3469855778_3212880686_p_10,(void *)work_a_3469855778_3212880686_p_11,(void *)work_a_3469855778_3212880686_p_12,(void *)work_a_3469855778_3212880686_p_13,(void *)work_a_3469855778_3212880686_p_14,(void *)work_a_3469855778_3212880686_p_15,(void *)work_a_3469855778_3212880686_p_16,(void *)work_a_3469855778_3212880686_p_17,(void *)work_a_3469855778_3212880686_p_18};
	xsi_register_didat("work_a_3469855778_3212880686", "isim/PIPELINED_FLOAT_ADDER_TB_isim_beh.exe.sim/work/a_3469855778_3212880686.didat");
	xsi_register_executes(pe);
}
