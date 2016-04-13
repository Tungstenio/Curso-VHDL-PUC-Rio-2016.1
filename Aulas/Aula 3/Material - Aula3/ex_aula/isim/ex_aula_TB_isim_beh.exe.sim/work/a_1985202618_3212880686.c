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
static const char *ng0 = "C:/Users/Opto2/Dropbox/Curso de Extensao VHDL/CLEAN/Aula3/ex_aula/src/counter_limit.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1985202618_3212880686_p_0(char *t0)
{
    char t20[16];
    char t21[16];
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
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3808);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(41, ng0);
    t2 = xsi_get_transient_memory(13U);
    memset(t2, 0, 13U);
    t4 = t2;
    memset(t4, (unsigned char)2, 13U);
    t5 = (t0 + 3920);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 13U);
    xsi_driver_first_trans_fast(t5);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 1832U);
    t11 = *((char **)t4);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 6424U);
    t5 = (t0 + 6477);
    t11 = (t21 + 0U);
    t14 = (t11 + 0U);
    *((int *)t14) = 0;
    t14 = (t11 + 4U);
    *((int *)t14) = 0;
    t14 = (t11 + 8U);
    *((int *)t14) = 1;
    t22 = (0 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t14 = (t11 + 12U);
    *((unsigned int *)t14) = t23;
    t14 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t20, t4, t2, t5, t21);
    t15 = (t20 + 12U);
    t23 = *((unsigned int *)t15);
    t24 = (1U * t23);
    t1 = (13U != t24);
    if (t1 == 1)
        goto LAB14;

LAB15:    t16 = (t0 + 3920);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t25 = *((char **)t19);
    memcpy(t25, t14, 13U);
    xsi_driver_first_trans_fast(t16);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(36, ng0);
    t4 = xsi_get_transient_memory(13U);
    memset(t4, 0, 13U);
    t14 = t4;
    memset(t14, (unsigned char)2, 13U);
    t15 = (t0 + 3920);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t4, 13U);
    xsi_driver_first_trans_fast(t15);
    goto LAB12;

LAB14:    xsi_size_not_matching(13U, t24, 0);
    goto LAB15;

}

static void work_a_1985202618_3212880686_p_1(char *t0)
{
    char t3[16];
    char t8[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 6424U);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t4 = (t0 + 6408U);
    t6 = (t0 + 6478);
    t9 = (t8 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 0;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t11 = (0 - 0);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t12;
    t10 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t3, t5, t4, t6, t8);
    t13 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t10, t3);
    if (t13 != 0)
        goto LAB3;

LAB4:
LAB5:    t19 = (t0 + 3984);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = (unsigned char)2;
    xsi_driver_first_trans_fast(t19);

LAB2:    t24 = (t0 + 3824);
    *((int *)t24) = 1;

LAB1:    return;
LAB3:    t14 = (t0 + 3984);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast(t14);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_1985202618_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(49, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4048);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3840);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1985202618_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1985202618_3212880686_p_0,(void *)work_a_1985202618_3212880686_p_1,(void *)work_a_1985202618_3212880686_p_2};
	xsi_register_didat("work_a_1985202618_3212880686", "isim/ex_aula_TB_isim_beh.exe.sim/work/a_1985202618_3212880686.didat");
	xsi_register_executes(pe);
}
