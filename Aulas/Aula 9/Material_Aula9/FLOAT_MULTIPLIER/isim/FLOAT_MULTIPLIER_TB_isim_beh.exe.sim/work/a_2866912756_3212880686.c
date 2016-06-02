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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso_de_Extensao_VHDL/Aulas/Aula 9/Material_Aula9/FLOAT_MULTIPLIER/NORM.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_2866912756_3212880686_p_0(char *t0)
{
    char t10[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 2832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (24 - 24);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(28, ng0);

LAB11:    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB12;

LAB1:    return;
LAB5:    xsi_set_current_line(29, ng0);
    t11 = (t0 + 1192U);
    t12 = *((char **)t11);
    t11 = (t0 + 6260U);
    t13 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t10, t12, t11, (unsigned char)3);
    t14 = (t10 + 12U);
    t15 = *((unsigned int *)t14);
    t16 = (1U * t15);
    t17 = (8U != t16);
    if (t17 == 1)
        goto LAB7;

LAB8:    t18 = (t0 + 3760);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t13, 8U);
    xsi_driver_first_trans_fast(t18);
    goto LAB4;

LAB6:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 3760);
    t9 = (t2 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_size_not_matching(8U, t16, 0);
    goto LAB8;

LAB9:    t3 = (t0 + 3648);
    *((int *)t3) = 0;
    goto LAB2;

LAB10:    goto LAB9;

LAB12:    goto LAB10;

}

static void work_a_2866912756_3212880686_p_1(char *t0)
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
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 3080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (24 - 24);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 6396);
    t9 = xsi_mem_cmp(t7, t2, 2U);
    if (t9 == 1)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (24 - 23);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 3824);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t15 = *((char **)t11);
    memcpy(t15, t2, 23U);
    xsi_driver_first_trans_fast(t7);

LAB4:    xsi_set_current_line(32, ng0);

LAB11:    t2 = (t0 + 3664);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB12;

LAB1:    return;
LAB5:    xsi_set_current_line(33, ng0);
    t10 = (t0 + 1032U);
    t11 = *((char **)t10);
    t12 = (24 - 22);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t10 = (t11 + t14);
    t15 = (t0 + 3824);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t10, 23U);
    xsi_driver_first_trans_fast(t15);
    goto LAB4;

LAB8:;
LAB9:    t3 = (t0 + 3664);
    *((int *)t3) = 0;
    goto LAB2;

LAB10:    goto LAB9;

LAB12:    goto LAB10;

}

static void work_a_2866912756_3212880686_p_2(char *t0)
{
    char t8[16];
    char t10[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = (7 - 7);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 1512U);
    t7 = *((char **)t6);
    t9 = ((IEEE_P_2592010699) + 4024);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 7);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 6292U);
    t6 = xsi_base_array_concat(t6, t8, t9, (char)97, t1, t10, (char)97, t7, t12, (char)101);
    t14 = (8U + 23U);
    t15 = (31U != t14);
    if (t15 == 1)
        goto LAB5;

LAB6:    t16 = (t0 + 3888);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t6, 31U);
    xsi_driver_first_trans_fast_port(t16);

LAB2:    t21 = (t0 + 3680);
    *((int *)t21) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(31U, t14, 0);
    goto LAB6;

}


extern void work_a_2866912756_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2866912756_3212880686_p_0,(void *)work_a_2866912756_3212880686_p_1,(void *)work_a_2866912756_3212880686_p_2};
	xsi_register_didat("work_a_2866912756_3212880686", "isim/FLOAT_MULTIPLIER_TB_isim_beh.exe.sim/work/a_2866912756_3212880686.didat");
	xsi_register_executes(pe);
}
