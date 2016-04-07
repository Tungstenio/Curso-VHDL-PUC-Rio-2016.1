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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/CLEAN/Aula4/tarefa/src/ShiftRegister.vhd";
extern char *IEEE_P_2592010699;



static void work_a_0595992924_3212880686_p_0(char *t0)
{
    char t20[16];
    char t21[16];
    char t23[16];
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
    unsigned int t22;
    int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

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
        goto LAB11;

LAB12:
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
    t4 = (t0 + 3816);
    t12 = (t4 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1992U);
    t5 = *((char **)t2);
    t16 = (0 - 7);
    t17 = (t16 * -1);
    t18 = (1U * t17);
    t19 = (0 + t18);
    t2 = (t5 + t19);
    t6 = *((unsigned char *)t2);
    t8 = (t0 + 3880);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t6;
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 6348);
    t5 = (t0 + 1992U);
    t8 = *((char **)t5);
    t17 = (7 - 7);
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
    t16 = (0 - 0);
    t22 = (t16 * 1);
    t22 = (t22 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t22;
    t14 = (t23 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 7;
    t15 = (t14 + 4U);
    *((int *)t15) = 1;
    t15 = (t14 + 8U);
    *((int *)t15) = -1;
    t24 = (1 - 7);
    t22 = (t24 * -1);
    t22 = (t22 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t22;
    t11 = xsi_base_array_concat(t11, t20, t12, (char)97, t2, t21, (char)97, t5, t23, (char)101);
    t22 = (1U + 7U);
    t1 = (8U != t22);
    if (t1 == 1)
        goto LAB13;

LAB14:    t15 = (t0 + 3816);
    t25 = (t15 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t11, 8U);
    xsi_driver_first_trans_fast(t15);
    goto LAB9;

LAB13:    xsi_size_not_matching(8U, t22, 0);
    goto LAB14;

}

static void work_a_0595992924_3212880686_p_1(char *t0)
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


extern void work_a_0595992924_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0595992924_3212880686_p_0,(void *)work_a_0595992924_3212880686_p_1};
	xsi_register_didat("work_a_0595992924_3212880686", "isim/tarefa_TB_isim_beh.exe.sim/work/a_0595992924_3212880686.didat");
	xsi_register_executes(pe);
}
