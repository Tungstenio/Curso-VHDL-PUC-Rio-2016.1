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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/Aulas/Aula 4/Material - Aula4/tx_rs232_vf/ShiftRegister_TX.vhd";
extern char *IEEE_P_2592010699;



static void work_a_2280449626_3212880686_p_0(char *t0)
{
    char t12[16];
    char t16[16];
    char t29[16];
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
    char *t13;
    char *t14;
    char *t15;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned char t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    int t30;

LAB0:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3720);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(34, ng0);
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
        goto LAB13;

LAB14:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 1512U);
    t11 = *((char **)t4);
    t13 = ((IEEE_P_2592010699) + 4024);
    t14 = (t0 + 6532U);
    t4 = xsi_base_array_concat(t4, t12, t13, (char)99, (unsigned char)2, (char)97, t11, t14, (char)101);
    t17 = ((IEEE_P_2592010699) + 4024);
    t15 = xsi_base_array_concat(t15, t16, t17, (char)97, t4, t12, (char)99, (unsigned char)2, (char)101);
    t18 = (1U + 8U);
    t19 = (t18 + 1U);
    t20 = (10U != t19);
    if (t20 == 1)
        goto LAB11;

LAB12:    t21 = (t0 + 3816);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t15, 10U);
    xsi_driver_first_trans_fast(t21);
    goto LAB9;

LAB11:    xsi_size_not_matching(10U, t19, 0);
    goto LAB12;

LAB13:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t26 = (0 - 9);
    t18 = (t26 * -1);
    t19 = (1U * t18);
    t27 = (0 + t19);
    t2 = (t5 + t27);
    t6 = *((unsigned char *)t2);
    t8 = (t0 + 3880);
    t11 = (t8 + 56U);
    t13 = *((char **)t11);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t6;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 6594);
    t5 = (t0 + 1992U);
    t8 = *((char **)t5);
    t18 = (9 - 9);
    t19 = (t18 * 1U);
    t27 = (0 + t19);
    t5 = (t8 + t27);
    t13 = ((IEEE_P_2592010699) + 4024);
    t14 = (t16 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 0;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t26 = (0 - 0);
    t28 = (t26 * 1);
    t28 = (t28 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t28;
    t15 = (t29 + 0U);
    t17 = (t15 + 0U);
    *((int *)t17) = 9;
    t17 = (t15 + 4U);
    *((int *)t17) = 1;
    t17 = (t15 + 8U);
    *((int *)t17) = -1;
    t30 = (1 - 9);
    t28 = (t30 * -1);
    t28 = (t28 + 1);
    t17 = (t15 + 12U);
    *((unsigned int *)t17) = t28;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t2, t16, (char)97, t5, t29, (char)101);
    t28 = (1U + 9U);
    t1 = (10U != t28);
    if (t1 == 1)
        goto LAB15;

LAB16:    t17 = (t0 + 3816);
    t21 = (t17 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 10U);
    xsi_driver_first_trans_fast(t17);
    goto LAB9;

LAB15:    xsi_size_not_matching(10U, t28, 0);
    goto LAB16;

}

static void work_a_2280449626_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3944);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3736);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2280449626_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2280449626_3212880686_p_0,(void *)work_a_2280449626_3212880686_p_1};
	xsi_register_didat("work_a_2280449626_3212880686", "isim/tx_rs232_vf_TB_isim_beh.exe.sim/work/a_2280449626_3212880686.didat");
	xsi_register_executes(pe);
}
