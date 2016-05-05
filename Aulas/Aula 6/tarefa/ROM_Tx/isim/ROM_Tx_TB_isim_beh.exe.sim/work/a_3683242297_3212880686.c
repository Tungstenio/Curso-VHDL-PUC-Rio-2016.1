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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aulas/Aula 5/TX_RX/ShiftRegister.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3683242297_3212880686_p_0(char *t0)
{
    char t20[16];
    char t21[16];
    char t24[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    int t22;
    unsigned int t23;
    int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4000);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1672U);
    t11 = *((char **)t4);
    t4 = (t0 + 4096);
    t12 = (t4 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 11U);
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1512U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    if (t7 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t16 = (11 - 1);
    t22 = (t16 - 10);
    t17 = (t22 * -1);
    t18 = (1U * t17);
    t19 = (0 + t18);
    t2 = (t4 + t19);
    t1 = *((unsigned char *)t2);
    t5 = (t0 + 4160);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t1;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2152U);
    t4 = *((char **)t2);
    t16 = (11 - 2);
    t17 = (10 - t16);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t2 = (t4 + t19);
    t5 = (t0 + 6788);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t21 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 9;
    t14 = (t13 + 4U);
    *((int *)t14) = 0;
    t14 = (t13 + 8U);
    *((int *)t14) = -1;
    t22 = (0 - 9);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t23;
    t14 = (t24 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t25 = (0 - 0);
    t23 = (t25 * 1);
    t23 = (t23 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t23;
    t11 = xsi_base_array_concat(t11, t20, t12, (char)97, t2, t21, (char)97, t5, t24, (char)101);
    t23 = (10U + 1U);
    t1 = (11U != t23);
    if (t1 == 1)
        goto LAB18;

LAB19:    t15 = (t0 + 4096);
    t26 = (t15 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t11, 11U);
    xsi_driver_first_trans_fast(t15);

LAB14:    goto LAB9;

LAB13:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2152U);
    t8 = *((char **)t2);
    t16 = (0 - 10);
    t17 = (t16 * -1);
    t18 = (1U * t17);
    t19 = (0 + t18);
    t2 = (t8 + t19);
    t9 = *((unsigned char *)t2);
    t11 = (t0 + 4160);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t9;
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 6787);
    t5 = (t0 + 2152U);
    t8 = *((char **)t5);
    t16 = (11 - 1);
    t17 = (10 - t16);
    t18 = (t17 * 1U);
    t19 = (0 + t18);
    t5 = (t8 + t19);
    t12 = ((IEEE_P_2592010699) + 4024);
    t13 = (t21 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 0;
    t14 = (t13 + 4U);
    *((int *)t14) = 0;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t22 = (0 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t23;
    t14 = (t24 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 10;
    t15 = (t14 + 4U);
    *((int *)t15) = 1;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t25 = (1 - 10);
    t23 = (t25 * -1);
    t23 = (t23 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t23;
    t11 = xsi_base_array_concat(t11, t20, t12, (char)97, t2, t21, (char)97, t5, t24, (char)101);
    t23 = (1U + 10U);
    t1 = (11U != t23);
    if (t1 == 1)
        goto LAB16;

LAB17:    t15 = (t0 + 4096);
    t26 = (t15 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t11, 11U);
    xsi_driver_first_trans_fast(t15);
    goto LAB14;

LAB16:    xsi_size_not_matching(11U, t23, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(11U, t23, 0);
    goto LAB19;

}

static void work_a_3683242297_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4224);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4016);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3683242297_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3683242297_3212880686_p_0,(void *)work_a_3683242297_3212880686_p_1};
	xsi_register_didat("work_a_3683242297_3212880686", "isim/ROM_Tx_TB_isim_beh.exe.sim/work/a_3683242297_3212880686.didat");
	xsi_register_executes(pe);
}
