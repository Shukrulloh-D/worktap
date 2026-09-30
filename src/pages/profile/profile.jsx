import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { StarIcon } from 'shared/ui/icon';
export const ProfilePage = () => {
  const { user } = useAuth();
  const [expanded, setExpanded] = useState(false);
  if (!user) return <div className="container" style={{ padding: 60 }}>Войдите в аккаунт</div>;
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 60, alignItems: 'center', marginBottom: 60 }}>
            <div>
              <div style={{ color: '#FBA457', fontWeight: 700, marginBottom: 4 }}>{user.role}</div>
              <h1 style={{ fontSize: 36, fontWeight: 800, marginBottom: 16 }}>{user.name}</h1>
              <p style={{ fontSize: 14, color: '#8B8B8B', lineHeight: 1.7, marginBottom: 20 }}>Работаю дизайнером с 1999 года. Вышло в газетах, журналах, типографиях, рекламных агентствах.</p>
              <div style={{ display: 'flex', gap: 8, marginBottom: 24, flexWrap: 'wrap' }}>
                {['Figma', 'Adobe photoshop', 'Adobe illustrator', 'Corel draw'].map(s => <span key={s} style={{ padding: '4px 12px', background: '#F5F5F7', borderRadius: 20, fontSize: 12 }}>{s}</span>)}
              </div>
              <button onClick={() => setExpanded(!expanded)} className="btn btn-ghost" style={{ padding: '12px 30px' }}>
                {expanded ? 'Скрыть информацию' : 'Показать подробную информацию'}
              </button>
              {expanded && (
                <div style={{ marginTop: 24, background: '#F5F0FF', padding: 24, borderRadius: 12 }}>
                  <div style={{ marginBottom: 8 }}><b>Страна:</b> Казахстан, Алматы</div>
                  <div style={{ marginBottom: 8 }}><b>На сайте:</b> 3 года</div>
                  <div><b>Образование:</b> КазНУ, Бакалавр</div>
                </div>
              )}
            </div>
            <div style={{ textAlign: 'center' }}>
              <div style={{ position: 'relative', display: 'inline-block' }}>
                <img src={user.avatar} alt="" style={{ width: 320, height: 320, borderRadius: '50%', objectFit: 'cover' }} />
                <div style={{ position: 'absolute', bottom: 20, right: 30, background: 'white', padding: '8px 16px', borderRadius: 12, boxShadow: '0 10px 30px rgba(0,0,0,0.1)', display: 'flex', gap: 2 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={16} />)}
                </div>
              </div>
            </div>
          </div>
          <h2 className="section-title">Мой ворки</h2>
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: 20 }}>
            <div style={{ background: '#E8F7EC', borderRadius: 12, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', minHeight: 200, cursor: 'pointer', color: '#21B349' }}>
              <div style={{ width: 60, height: 60, borderRadius: '50%', background: '#21B349', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 30, marginBottom: 12 }}>+</div>
              <div style={{ fontWeight: 700, fontSize: 16 }}>Создать ворк</div>
            </div>
            {Array(3).fill(null).map((_, i) => (
              <div key={i} className="hoverLift" style={{ background: 'white', borderRadius: 12, overflow: 'hidden', border: '1px solid #F0F0F0' }}>
                <img src={`https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300&sig=${i}`} alt="" style={{ width: '100%', aspectRatio: '4/3', objectFit: 'cover' }} />
                <div style={{ padding: 16 }}>
                  <div style={{ fontWeight: 700, fontSize: 14, marginBottom: 4 }}>Дизайн сайта</div>
                  <div style={{ color: '#21B349', fontWeight: 700, fontSize: 14 }}>50 000 тенге</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
