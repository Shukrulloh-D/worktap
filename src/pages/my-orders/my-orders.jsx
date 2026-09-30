import { useState } from 'react';
import { MY_ORDERS } from 'shared/api/mocks';
export const MyOrdersPage = () => {
  const [tab, setTab] = useState('all');
  const orders = tab === 'all' ? MY_ORDERS : MY_ORDERS.filter(o => o.status === (tab === 'active' ? 'Прием ставок' : 'Завершено'));
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title" style={{ textAlign: 'center' }}>Мои <span style={{ color: '#FBA457' }}>заказы</span></h1>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 32, flexWrap: 'wrap', gap: 16 }}>
            <div style={{ fontSize: 16, fontWeight: 700 }}>Всего {orders.length} заявок</div>
            <div style={{ display: 'flex', gap: 16 }}>
              {[['all', 'Все'], ['active', 'Активные'], ['done', 'Завершенные']].map(([k, l]) => (
                <button key={k} onClick={() => setTab(k)} style={{ fontWeight: 600, color: tab === k ? '#21B349' : '#8B8B8B', background: 'none', border: 'none', cursor: 'pointer' }}>{l}</button>
              ))}
            </div>
          </div>
          {orders.map(o => (
            <div key={o.id} style={{ background: 'white', borderRadius: 12, padding: 24, marginBottom: 16, display: 'grid', gridTemplateColumns: '1fr auto', gap: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>{o.title}</h3>
                <p style={{ fontSize: 13, color: '#8B8B8B', lineHeight: 1.6, marginBottom: 16, maxWidth: 600 }}>{o.desc}</p>
                <div style={{ color: o.status === 'Прием ставок' ? '#FBA457' : o.status === 'Завершено' ? '#21B349' : '#F04438', fontWeight: 600, fontSize: 13 }}>{o.status}</div>
              </div>
              <div style={{ textAlign: 'right' }}>
                <div style={{ color: '#21B349', fontWeight: 700, fontSize: 16 }}>Бюджет: {o.budget.toLocaleString()} тенге</div>
                <div style={{ fontSize: 12, color: '#8B8B8B', marginTop: 4 }}>{o.time}</div>
                <div style={{ fontSize: 13, color: '#8B8B8B', marginTop: 12 }}>Предложений: {o.offers}</div>
              </div>
            </div>
          ))}
        </div>
      </section>
    </div>
  );
};
