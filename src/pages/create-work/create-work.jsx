import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useToast } from 'shared/lib/toast';
const STEPS = ['Основное','Стоимость и опции','Описание','Требования','Галерея','Публикация'];
export const CreateWorkPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [step, setStep] = useState(0);
  const next = () => {
    if (step < STEPS.length - 1) setStep(step + 1);
    else { toast('Ворк опубликован!'); nav('/works'); }
  };
  return (
    <div className="pageFadeIn">
      <section style={{ padding: '40px 0' }}>
        <div className="container">
          <h1 className="section-title">Создание ворка</h1>
          <div style={{ display: 'flex', gap: 8, marginBottom: 40, flexWrap: 'wrap' }}>
            {STEPS.map((s, i) => (
              <div key={s} style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <div style={{ width: 36, height: 36, borderRadius: '50%', background: i <= step ? '#21B349' : '#E5E5E5', color: 'white', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, fontSize: 14 }}>{i + 1}</div>
                <span style={{ fontSize: 13, fontWeight: 500, color: i === step ? '#21B349' : '#8B8B8B' }}>{s}</span>
              </div>
            ))}
          </div>
          <div style={{ background: 'white', borderRadius: 16, padding: 40, boxShadow: '0 4px 20px rgba(0,0,0,0.03)', minHeight: 400 }}>
            {step === 0 && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: 20, maxWidth: 600 }}>
                <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label><input className="input" placeholder="Placeholder" /></div>
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 16 }}>
                  <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label><select className="input"><option>Placeholder</option></select></div>
                  <div><label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Подкатегория</label><select className="input"><option>Placeholder</option></select></div>
                </div>
                <div>
                  <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Теги</label>
                  <div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
                    {['Тег 1','Тег 2','Дизайн сайта','Тег 1','Тег 2','Дизайн сайта'].map((t, i) => (
                      <span key={i} style={{ padding: '6px 12px', background: '#F5F5F7', borderRadius: 20, fontSize: 12 }}>{t}</span>
                    ))}
                  </div>
                </div>
              </div>
            )}
            {step === 1 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 20 }}>Пакеты</h3>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 20 }}>
                  {['Эконом', 'Стандарт', 'Бизнес'].map(p => (
                    <div key={p} style={{ border: '1px solid #E5E5E5', borderRadius: 12, padding: 20 }}>
                      <h4 style={{ fontSize: 16, fontWeight: 700, textAlign: 'center', marginBottom: 20 }}>{p}</h4>
                      {['Описание пакета','Срок выполнения','Количество доработок','Стоимость в тенге'].map(f => (
                        <div key={f} style={{ marginBottom: 12 }}>
                          <label style={{ fontSize: 12, fontWeight: 600, display: 'block', marginBottom: 4 }}>{f}</label>
                          <input className="input" placeholder="Placeholder" style={{ padding: '8px 12px', fontSize: 13 }} />
                        </div>
                      ))}
                      <button className="btn btn-light btn-full btn-sm" style={{ marginTop: 8 }}>Добавить опцию</button>
                    </div>
                  ))}
                </div>
              </div>
            )}
            {step === 2 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Описание</h3>
                <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 150, marginBottom: 32 }} />
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Часто задаваемые вопросы</h3>
                <input className="input" placeholder="Вопрос" style={{ marginBottom: 12 }} />
                <input className="input" placeholder="Ответ" style={{ marginBottom: 12 }} />
              </div>
            )}
            {step === 3 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Расскажите покупателю, что вам нужно для начала работы над заказом.</h3>
                <textarea className="input" placeholder="Кратко опишите требования" style={{ minHeight: 200 }} />
              </div>
            )}
            {step === 4 && (
              <div>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 12 }}>Создайте свою галерею</h3>
                <div style={{ background: '#FFE4E4', borderRadius: 12, aspectRatio: '4/3', maxWidth: 300, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', border: '2px dashed #FBA457', marginBottom: 20 }}>
                  <div style={{ fontSize: 32, color: '#FBA457' }}>+</div>
                  <div style={{ fontSize: 12, color: '#FBA457', fontWeight: 600 }}>Добавить фото</div>
                </div>
              </div>
            )}
            {step === 5 && (
              <div style={{ textAlign: 'center', padding: '40px 0' }}>
                <h3 style={{ fontSize: 24, fontWeight: 800, marginBottom: 12 }}>Поздравляем!</h3>
                <p style={{ fontSize: 14, color: '#8B8B8B', marginBottom: 32 }}>Ваш ворк готов к публикации</p>
                <div style={{ fontSize: 100 }}>🎉</div>
              </div>
            )}
            <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: 40 }}>
              <button onClick={() => step > 0 ? setStep(step - 1) : nav(-1)} className="btn btn-ghost" style={{ padding: '12px 40px' }}>Назад</button>
              <button onClick={next} className="btn btn-primary" style={{ padding: '12px 40px' }}>{step === STEPS.length - 1 ? 'Опубликовать' : 'Дальше'}</button>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
