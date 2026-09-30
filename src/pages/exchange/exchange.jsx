import { useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import { EXCHANGE_JOBS } from 'shared/api/mocks';
import { StarIcon } from 'shared/ui/icon';

export const ExchangePage = () => {
  const nav = useNavigate();
  const [params] = useSearchParams();
  const [visible, setVisible] = useState(6);
  const category = params.get('cat');
  const jobs = [...EXCHANGE_JOBS, ...EXCHANGE_JOBS].slice(0, visible);

  return (
    <div className="pageFadeIn">
      <section style={{ background: 'linear-gradient(135deg, #FFF5EB 0%, #FFF 60%)', padding: '60px 0', textAlign: 'center' }}>
        <div className="container">
          <h1 style={{ fontSize: 32, fontWeight: 800, marginBottom: 24, maxWidth: 700, margin: '0 auto 24px' }}>
            Ищите и находите подходящую работу среди <span style={{ color: '#21B349' }}>10,000+</span> проектов
          </h1>
          <div style={{ display: 'flex', gap: 8, maxWidth: 600, margin: '0 auto 24px' }}>
            <input className="input" placeholder="Какую работу ищете?" style={{ flex: 1 }} />
            <button className="btn btn-peach" style={{ padding: '12px 32px' }}>Найти</button>
          </div>
          <div style={{ display: 'flex', gap: 12, justifyContent: 'center', flexWrap: 'wrap' }}>
            {['Тексты и переводы','Разработка','Дизайн','Аудио, видео монтаж','SEO и оптимизация','Бизнес и жизнь','Соцсети и реклама'].map(c => (
              <button key={c} onClick={() => nav(`/exchange?cat=${c}`)} style={{ padding: '6px 14px', border: '1px solid #E5E5E5', borderRadius: 20, background: 'white', fontSize: 12, cursor: 'pointer' }}>{c}</button>
            ))}
          </div>
        </div>
      </section>
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h2 style={{ fontSize: 20, fontWeight: 700, marginBottom: 20, textAlign: 'center' }}>Ниже все заказы по {category || 'дизайну'}</h2>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 24, flexWrap: 'wrap', gap: 16 }}>
            <div style={{ fontSize: 14, color: '#8B8B8B' }}>65 проектов по {category || 'дизайну'}</div>
            <div style={{ display: 'flex', gap: 16 }}>
              <input className="input" placeholder="Минимальная цена" style={{ width: 150, padding: '8px 12px' }} />
              <input className="input" placeholder="Максимальная цена" style={{ width: 150, padding: '8px 12px' }} />
              <select className="input" style={{ width: 180, padding: '8px 12px' }}><option>По возрастанию цены</option></select>
            </div>
          </div>
          {jobs.map((j, idx) => (
            <div key={idx} className="hoverLift" style={{ background: 'white', borderRadius: 12, padding: 24, marginBottom: 16, display: 'grid', gridTemplateColumns: '1fr auto', gap: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>{j.title}</h3>
                <div style={{ display: 'flex', gap: 12, alignItems: 'center', marginBottom: 8 }}>
                  <img src={j.avatar} alt="" style={{ width: 40, height: 40, borderRadius: '50%' }} />
                  <div>
                    <div style={{ fontSize: 13, fontWeight: 600 }}>{j.author}</div>
                    <div style={{ fontSize: 12, color: '#8B8B8B' }}>Размещено проектов на бирже: {j.postedProjects}</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, alignItems: 'center' }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= j.rating} size={14} />)}
                  <span style={{ fontSize: 12, color: '#8B8B8B', marginLeft: 8 }}>{j.reviews} отзывов</span>
                </div>
              </div>
              <div style={{ textAlign: 'right' }}>
                <div style={{ color: '#21B349', fontWeight: 700, fontSize: 16 }}>Бюджет: {j.budget.toLocaleString()} тенге</div>
                <div style={{ fontSize: 12, color: '#8B8B8B', marginTop: 4 }}>{j.time}</div>
                <div style={{ fontSize: 13, color: '#8B8B8B', marginTop: 12 }}>Предложений: {j.offers}</div>
              </div>
            </div>
          ))}
          {visible < 16 && (
            <div style={{ textAlign: 'center', marginTop: 32 }}>
              <button onClick={() => setVisible(v => v + 6)} className="btn btn-outline" style={{ padding: '12px 40px' }}>Загрузить еще</button>
            </div>
          )}
        </div>
      </section>
    </div>
  );
};
