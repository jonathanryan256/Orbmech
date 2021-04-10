import math
u_s = 1.1723328*10**18
u_earth = 3.986004418*10**14
class orbit:
    def __init__(self, u, a, e, arg_per, in_mean, epoch, cur_true):
        self.u = u
        self.a = a
        self.e = e
        self.arg_per = arg_per
        self.in_mean = in_mean
        self.epoch = epoch
        self.cur_true = cur_true%math.tau

    def Tfa(self):
        return math.tau*math.sqrt((self.a**3)/self.u)
    def mean_anomaly(self):
        E_m = math.acos((self.e + math.cos(self.cur_true))/(1+self.e*math.cos(self.cur_true)))
        if self.cur_true <= math.pi:
            pass
        else:
            E_m = math.tau - E_m
        mean_value = E_m - self.e*math.sin(E_m)
        return mean_value
    def rftrue(self):
        return self.a*(1-self.e**2)/(1+self.e*math.cos(self.cur_true))
    def spec_efa(self):
        return -self.u/(2*self.a)
    def vf_true_a(self):
        return math.sqrt(2*(self.spec_efa()+self.u/self.rftrue()))
    def cfcur_true(self): #flight path angle
        return math.acos((1 + self.e*math.cos(self.cur_true))/math.sqrt(1+self.e**2+2*self.e*math.cos(self.cur_true)))
    def apfa_e(self):
        return self.a*(1+self.e)
    def pefa_e(self):
        self.a*(1-self.e)

class mean:
    def __init__(self, cls, t):
        self.cls = cls
        self.t = t

    def cur_mean(self):
        return (self.cls.in_mean + math.tau*(self.t%self.cls.Tfa())/self.cls.Tfa())%(math.tau)

class true:
    def __init__(self, cls, cu_mean):
        self.cls = cls
        self.cu_mean = cu_mean
    def true_anomaly(self):
        E = self.cu_mean
        for x in range(30):
            E = E-(E-self.cls.e*math.sin(E)-self.cu_mean)/(1-self.cls.e*math.cos(E))
        if E % math.tau > math.pi:
            tr_an = 2*math.pi-math.acos((math.cos(E)-self.cls.e)/(1-self.cls.e*math.cos(E)))
        else:
            tr_an = math.acos((math.cos(E)-self.cls.e)/(1-self.cls.e*math.cos(E)))
        return tr_an

class orbit_hyper:
    def __init__(self, u, v, alt, ang_diff, pe):
        self.u = u
        self.v = v
        self.alt = alt
        self.ang_diff = ang_diff
        self.pe = pe

    def spec_efv_alt(self):
        return self.v**2/2 -self.u/self.alt
    def afspec_e(self):
        return -self.u/(2*self.spec_efv_alt())
    def efang_diff(self):
        return 0-(math.cos((self.ang_diff+math.pi)/2))**(-1)
    def pefe_spec_e(self):
        return self.afspec_e()*(1-self.efang_diff())
    def efpe_a(self):
        return self.pe/(0-self.afspec_e())+1
    def t_anfalt_pe_v(self):
        return math.acos((self.afspec_e()*(1-self.efpe_a()**2)-self.alt)/(self.alt*self.efpe_a()))

class hyper_mean:
    def __init__(self, cls, true):
        self.cls = cls
        self.true = true
    def hm(self):
        H = math.acosh((self.cls.efpe_a() + math.cos(self.true))/(1+self.cls.efpe_a()*math.cos(self.true)))
        if self.true < 0:
            H = -H
        else:
            pass
        return self.cls.efpe_a()*math.sinh(H)-H
    def time(self):
        return math.sqrt(((-self.cls.afspec_e())**3)/self.cls.u)*self.hm()
class orbit_ellipse:
    def __init__(self, u, T, v, alt, ap, pe):
        self.u = u
        self.T = T
        self.v = v
        self.alt = alt
        self.ap = ap
        self.pe = pe

    def afT(self):
        return ((self.u*self.T**2)/(math.tau**2))**(1/3)
    def afpe_ap(self):
        return (self.ap+self.pe)/2
    def spec_efv_alt(self):
        return self.v**2/2 -self.u/self.alt
    def afspec_e(self):
        return -self.u/(2*self.spec_efv_alt())
    def pefv_alt_ap(self):
        return 2*self.afspec_e()-self.ap
    def apfv_alt_ap_pe(self):
        return 2*self.afspec_e()-self.pe
    def pefT_ap(self):
        return 2*self.afT()-self.ap
    def apfT_pe(self):
        return 2*self.afT()-self.pe
    def efT_ap(self):
        return (self.ap-self.pefT_ap())/(self.ap+self.pefT_ap())
    def efT_pe(self):
        return (self.apfT_pe()-self.pe)/(self.apfT_pe()+self.pe)
    def efpe_ap(self):
        return (self.ap-self.pe)/(self.ap+self.pe)
    def tr_anfalt_pe_ap(self):
        return math.acos((self.afpe_ap()*(1-self.efpe_ap()**2)-self.alt)/(self.alt*self.efpe_ap()))
kerbin_orbit = orbit(u_s, 13599840256, 0, 0, math.pi,0, math.pi)
eve_orbit = orbit(u_s, 9832684544, 0.01, 0, math.pi, 0, math.pi)
#print(kerbin_orbit.mean_anomaly())
#print(craft_orbit.spec_efa())
#print(kerbin_orbit.vf_r_and_a())
print((orbit(u_s, 20000000000, 0, 0, 0, 0, 0).Tfa()- orbit(u_s, 20020000000, 0, 0, 0, 0, 0).Tfa())/3600/2)
'''def true_anomaly(self):
        E = self.cur_mean()
        for x in range(30):
            E = E-(E-self.e*math.sin(E)-self.cur_mean())/(1-self.e*math.cos(E))
        print(E)
        if E % math.tau > math.pi:
            tr_an = 2*math.pi-math.acos((math.cos(E)-self.e)/(1-self.e*math.cos(E)))
        else:
            tr_an = math.acos((math.cos(E)-self.e)/(1-self.e*math.cos(E)))
        return tr_an'''