import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
export const CreateOrderPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [form, setForm] = useState({ title: '', desc: '', days: 14, budget: 250000 });
  const submit = (e) => {
    e.preventDefault();
    if (!form.title || !form.desc) { toast('Заполните обязательные поля'); return; }
    toast('Заказ опубликован!');
    nav('/my-orders');
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0 80px' }}>
        <div className="container" style={{ maxWidth: 800 }}>
          <h1 className="section-title">Опубликуйте ваш заказ</h1>
          <form onSubmit={submit} style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
            <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label><input className="input" placeholder="Placeholder" value={form.title} onChange={(e) => setForm({ ...form, title: e.target.value })} /></div>
            <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Описание</label><textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 120 }} value={form.desc} onChange={(e) => setForm({ ...form, desc: e.target.value })} /></div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label><select className="input"><option>Placeholder</option><option>Дизайн</option></select></div>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Подкатегория</label><select className="input"><option>Placeholder</option></select></div>
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Срок выполнения в днях</label><input type="number" className="input" value={form.days} onChange={(e) => setForm({ ...form, days: +e.target.value })} /></div>
              <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Бюджет в тенге</label><input type="number" className="input" value={form.budget} onChange={(e) => setForm({ ...form, budget: +e.target.value })} /></div>
            </div>
            <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 20 }}>
              <button type="button" onClick={() => nav(-1)} className="btn btn-ghost" style={{ padding: '12px 40px' }}>Назад</button>
              <button type="submit" className="btn btn-primary" style={{ padding: '12px 40px' }}>Опубликовать</button>
            </div>
          </form>
        </div>
      </section>
    </div>
  );
};
