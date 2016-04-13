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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/CLEAN/Aula5/memoria/src/generic_ROM_tb.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1140422295_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2600);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 3440);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2600);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1140422295_2372691052_p_1(char *t0)
{
    char t15[16];
    char t16[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int64 t9;
    unsigned char t10;
    unsigned char t11;
    int64 t12;
    int t13;
    int t14;
    int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 3040U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 6096);
    t4 = (t0 + 3504);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(58, ng0);
    t9 = (50 * 1000LL);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t9);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);

LAB10:    t2 = (t0 + 3360);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    t3 = (t0 + 3360);
    *((int *)t3) = 0;
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t9);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)3);
    if (t11 == 1)
        goto LAB8;
    else
        goto LAB10;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 1);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t12);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 2);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t12);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 6101);
    t4 = (t0 + 3504);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1808U);
    t3 = *((char **)t2);
    t9 = *((int64 *)t3);
    t12 = (t9 * 2);
    t2 = (t0 + 2848);
    xsi_process_wait(t2, t12);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 6106);
    t4 = (t0 + 3504);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 5U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(71, ng0);
    t2 = (t0 + 3568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 6111);
    *((int *)t2) = 0;
    t3 = (t0 + 6115);
    *((int *)t3) = 63;
    t13 = 0;
    t14 = 63;

LAB28:    if (t13 <= t14)
        goto LAB29;

LAB31:    xsi_set_current_line(77, ng0);

LAB41:    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB29:    xsi_set_current_line(73, ng0);
    t4 = (t0 + 1808U);
    t5 = *((char **)t4);
    t9 = *((int64 *)t5);
    t4 = (t0 + 2848);
    xsi_process_wait(t4, t9);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB30:    t2 = (t0 + 6111);
    t13 = *((int *)t2);
    t3 = (t0 + 6115);
    t14 = *((int *)t3);
    if (t13 == t14)
        goto LAB31;

LAB38:    t17 = (t13 + 1);
    t13 = t17;
    t4 = (t0 + 6111);
    *((int *)t4) = t13;
    goto LAB28;

LAB32:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 6024U);
    t4 = (t0 + 6119);
    t6 = (t16 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 0;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t17 = (0 - 0);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t18;
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t15, t3, t2, t4, t16);
    t8 = (t15 + 12U);
    t18 = *((unsigned int *)t8);
    t19 = (1U * t18);
    t10 = (5U != t19);
    if (t10 == 1)
        goto LAB36;

LAB37:    t20 = (t0 + 3504);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t7, 5U);
    xsi_driver_first_trans_fast(t20);
    goto LAB30;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_size_not_matching(5U, t19, 0);
    goto LAB37;

LAB39:    goto LAB2;

LAB40:    goto LAB39;

LAB42:    goto LAB40;

}


extern void work_a_1140422295_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1140422295_2372691052_p_0,(void *)work_a_1140422295_2372691052_p_1};
	xsi_register_didat("work_a_1140422295_2372691052", "isim/generic_ROM_tb_isim_beh.exe.sim/work/a_1140422295_2372691052.didat");
	xsi_register_executes(pe);
}
