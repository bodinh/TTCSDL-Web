﻿using CAFE_Song_Lo.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace CAFE_Song_Lo.Areas.admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: admin/Home
        QuanLyCafeEntities db = new QuanLyCafeEntities();
        classdata data = new classdata();
        public ActionResult Index(int? id, int? temp)
        {
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                if (Session["idbill"] != null)
                {
                    var x = dbb.billinfoes.ToList().Where(s => s.idbill == int.Parse(Session["idbill"].ToString())).FirstOrDefault();
                    if (id != null && x == null)
                    {
                        //nếu không tìm thấy billinfo của bill thì thông báo chưa chọn món.
                        //3 là trạng thái gửi sang page order 
                        return RedirectToAction("index", "order", new { id = id, status = 3 });
                    }
                }

            }
            if (id != null)
            {
                ViewBag.temp = 0;
            }
            //nếu id != null và bàn trống tức là có bàn yêu cầu xác nhận đặt món
            if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() != null)
            {
                ViewBag.temp = temp;
                db.customer_table(id);
            }
            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                data.alltablefoods = dbb.tablefoods.SqlQuery("select * from tablefood").ToList();
            }
            return View(data);
        }

        public ActionResult product()
        {
            data.top10sell = db.top10bestsell().ToList();
            data.allfoods = db.foods.ToList();
            return View(data);
        }
        [HttpGet]
        public ActionResult Setting(string searchstring, int? page, string Status)
        {
            ViewBag.search = searchstring;
            ViewBag.status = Status;
            if (!string.IsNullOrEmpty(searchstring))
            {
                data.allstaffs = db.staffs.Where(s => s.name.Contains(searchstring)).ToList();
                if (!string.IsNullOrEmpty(Status))
                {
                    if (string.Compare(Status, "Status", true) != 0)
                    {
                        data.allstaffs = data.allstaffs.Where(s => s.status.CompareTo(Status) == 0).ToList();
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(Status))
                {
                    if (string.Compare(Status, "Status", true) != 0)
                    {
                        data.allstaffs = db.staffs.Where(s => s.status.CompareTo(Status) == 0).ToList();
                    }
                    else
                    {
                        data.allstaffs = db.staffs.ToList();
                    }
                }
                else data.allstaffs = db.staffs.ToList();
            }

            int pageSize = 5;
            int pagenumber = page ?? 1;
            ViewBag.count = db.staffs.ToList().Count();
            return View(data.allstaffs.ToPagedList(pagenumber, pageSize));
        }
        public ActionResult Supplier(int? page)
        {
            SupplierData data = new SupplierData();
            int pageSize = 5;
            int pagenumber = page ?? 1;
            //data.allnhacungcaps = (IPagedList<nhacungcap>)db.nhacungcaps.ToList();
            List<nhacungcap> listNCC = db.nhacungcaps.ToList();
            ViewBag.count = listNCC.Count();
            data.allnhacungcaps = db.nhacungcaps.ToList().ToPagedList(pagenumber, pageSize);
            data.listnamesanpham = new List<string>();
            data.listallmoneynhapsanphams = new List<string>();
            foreach (var item in data.allnhacungcaps)
                using (QuanLyCafeEntities cfdb = new QuanLyCafeEntities())
                {
                    var sp = cfdb.nhapsanphams.ToList().Where(s => s.idncc == item.id).FirstOrDefault();
                        data.listnamesanpham.Add(sp.tensanpham);
                        data.listallmoneynhapsanphams.Add(sp.tongtien.ToString());
                }
            return View(data);
        }

        public ActionResult receipt(int? page)
        {
            ReceiptData data = new ReceiptData();
            int pageSize = 5;
            int pagenumber = page ?? 1;
            double? tongtien = 0;
            List<bill> listbill = db.bills.Where(s => s.Tongtien > 0).ToList();
            ViewBag.count = listbill.Count();
            foreach (var item in listbill)
            {
                tongtien += item.Tongtien;
            }
            ViewBag.Tongtien = tongtien;
            data.allbills = db.bills.ToList().Where(s => s.Tongtien > 0).ToPagedList(pagenumber, pageSize);
            data.listnames = new List<string>();

            foreach (var item in data.allbills)
            {
                tongtien += item.Tongtien;
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    var x = dbb.staffs.ToList().Where(s => s.idaccount == item.idaccount).FirstOrDefault();
                    data.listnames.Add(x.name);
                }
            }
            return View(data);
        }
        public ActionResult editstaff(int id)
        {
            classdata edit = new classdata();
            edit.allstaffs = new List<Models.staff>();
            var x = db.staffs.ToList().Where(s => s.idstaff == id).FirstOrDefault();
            ViewBag.editstaff = x;
            return View();
        }
        public ActionResult deletestaff(int id)
        {
            using (QuanLyCafeEntities db = new QuanLyCafeEntities())
            {
                try
                {
                    data.allstaffs = db.staffs.ToList();
                    db.deletestaffaccount(id);
                }
                catch
                {
                    return RedirectToAction("setting", "Home", new { area = "admin" });
                }
            }
            return RedirectToAction("setting", "Home", new { area = "admin" });
        }

        [HttpPost]
        public ActionResult savestaff(Models.staff savestaff)
        {
            try
            {
                db.updatestaff(savestaff.idstaff, savestaff.name, savestaff.status, savestaff.position, savestaff.email, savestaff.idaccount);
            }
            catch
            {
                return RedirectToAction("setting", "Home", new { area = "admin" });
            }
            return RedirectToAction("setting", "Home", new { area = "admin" });
        }
        [HttpPost]
        public ActionResult addstaff(Models.staff astaff)
        {
            using (QuanLyCafeEntities db = new QuanLyCafeEntities())
            {
                data.allstaffs = db.staffs.ToList();
                int idaccount = data.allstaffs[data.allstaffs.Count() - 1].idaccount + 1;
                string username = "user" + idaccount.ToString();
                string password = "12345678";
                string type = "staff";
                db.Addstaffaccountlatest(astaff.name, astaff.status, astaff.position, astaff.email, idaccount, username, password, type);
            }
            return RedirectToAction("setting", "Home", new { area = "admin" });
        }

        classdata cartfood = new classdata();
        public ActionResult bill(int? id, int? temp)
        {

            if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() == null)
            {
                ViewBag.temp = temp;
                db.empty_table(id);
                var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                x.status = "1";
                x.idaccount = int.Parse(Session["idaccount"].ToString());
                x.datecheckout = DateTime.Now;
                //tính tổng tiền của bàn
                double tongtien = 0;
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    cartfood.allbillinfos = dbb.billinfoes.ToList();
                    foreach (billinfo item in cartfood.allbillinfos)
                    {
                        if (item.idbill == int.Parse(Session["idbill"].ToString()))
                        {
                            var y = dbb.foods.ToList().Where(s => s.id == item.idfood).FirstOrDefault();
                            tongtien += (item.count * y.price);
                        }
                    }
                }
                x.Tongtien = tongtien;
                db.SaveChanges();
            }
            else if (id != null && db.tablefoods.ToList().Where(s => s.id == id && string.Compare(s.status, "trống", true) == 0).FirstOrDefault() != null)
            {
                ViewBag.temp = temp;
                db.empty_table(id);
                var x = db.bills.ToList().Where(s => s.idtable == id && string.Compare(s.status, "0", true) == 0).FirstOrDefault();
                x.status = "1";
                x.idaccount = int.Parse(Session["idaccount"].ToString());
                x.datecheckout = DateTime.Now;
                //tính tổng tiền của bàn
                double tongtien = 0;
                using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
                {
                    cartfood.allbillinfos = dbb.billinfoes.ToList();
                    foreach (billinfo item in cartfood.allbillinfos)
                    {
                        if (item.idbill == int.Parse(Session["idbill"].ToString()))
                        {
                            var y = dbb.foods.ToList().Where(s => s.id == item.idfood).FirstOrDefault();
                            tongtien += (item.count * y.price);
                        }
                    }
                }
                if (tongtien == 0)
                {
                    return RedirectToAction("index", "order", new { id = id, status = 4 });
                }
                else
                {
                    x.Tongtien = tongtien;
                    db.SaveChanges();
                }
            }
            //nếu thanh toán khi chưa chọn xác nhận

            using (QuanLyCafeEntities dbb = new QuanLyCafeEntities())
            {
                //List<bill> x = dbb.bills.SqlQuery("select * from bill where ");
                //dbb.delete_billinfo(x.id);
                data.alltablefoods = dbb.tablefoods.SqlQuery("select * from tablefood").ToList();
            }
            return View("index", data);
        }
    }
}