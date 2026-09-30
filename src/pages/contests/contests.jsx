import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import styles from './contests.module.css';

const STEPS = ['Что такое конкурс?', 'Основное', 'Описание', 'Оплата', 'Публикация'];
const STEP_DATA = [
  { icon: '📋', t: 'Опубликуйте бриф', d: 'Зарезервируйте бюджет конкурса, и мы уведомим всех исполнителей.' },
  { icon: '🎨', t: 'Получайте варианты', d: 'Участники будут присылать вам готовые работы, которые вы сможете оценивать.' },
  { icon: '🏆', t: 'Выберите победителя', d: 'Определитесь с наилучшей работой на стадии финала и выберите ее победителем.' },
  { icon: '📦', t: 'Получите готовую работу', d: 'Проведите доработки в рабочей области, если это необходимо.' },
];

export const ContestsPage = () => {
  const nav = useNavigate();
  const [step, setStep] = useState(0);

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <h1 className={styles.title}>Создание конкурса</h1>
          <div className={styles.card}>
            <div className={styles.steps}>
              {STEPS.map((s, i) => (
                <div key={s} className={styles.step}>
                  <div className={`${styles.stepNum} ${i <= step ? styles.stepActive : ''}`}>{i + 1}</div>
                  <span className={`${styles.stepLabel} ${i === step ? styles.stepLabelActive : ''}`}>{s}</span>
                </div>
              ))}
            </div>

            {step === 0 && (
              <div className={styles.grid4}>
                {STEP_DATA.map((s, i) => (
                  <div key={i}>
                    <div className={styles.stepIcon}>{s.icon}</div>
                    <div className={styles.stepTitle}>{s.t}</div>
                    <div className={styles.stepDesc}>{s.d}</div>
                  </div>
                ))}
              </div>
            )}
            {step === 1 && (
              <div style={{ maxWidth: 600 }}>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Название</label>
                <input className="input" placeholder="Название конкурса" style={{ marginBottom: 16 }} />
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Категория</label>
                <input className="input" placeholder="Выберите категорию" style={{ marginBottom: 16 }} />
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Бюджет</label>
                <input className="input" placeholder="250 000 тенге" />
              </div>
            )}
            {step === 2 && (
              <div style={{ maxWidth: 700 }}>
                <label style={{ fontSize: 13, fontWeight: 600, display: 'block', marginBottom: 6 }}>Описание</label>
                <textarea className="input" placeholder="Опишите конкурс" style={{ minHeight: 200 }} />
              </div>
            )}
            {step === 3 && (
              <div style={{ textAlign: 'center', padding: '20px 0' }}>
                <div style={{ fontSize: 14, color: 'var(--c-gray)', marginBottom: 12 }}>Сумма к оплате</div>
                <div style={{ fontSize: 28, fontWeight: 800, color: 'var(--c-primary)', marginBottom: 24 }}>250 000 тенге</div>
                <div style={{ display: 'flex', gap: 16, justifyContent: 'center', flexWrap: 'wrap' }}>
                  {['QIWI','WebMoney','VISA','MC'].map(p => (
                    <div key={p} style={{ padding: '12px 24px', background: '#fff', border: '1px solid var(--c-border)', borderRadius: 8, fontWeight: 700 }}>{p}</div>
                  ))}
                </div>
              </div>
            )}
            {step === 4 && (
              <div style={{ textAlign: 'center', padding: '40px 0' }}>
                <h3 style={{ fontSize: 24, fontWeight: 800, marginBottom: 12 }}>Поздравляем!</h3>
                <p style={{ fontSize: 14, color: 'var(--c-gray)', marginBottom: 24 }}>Ваш конкурс готов к публикации</p>
                <div style={{ fontSize: 100 }}>🎉</div>
              </div>
            )}

            <div className={styles.btnRow}>
              <button className="btn btn-ghost" style={{ padding: '12px 40px' }} onClick={() => step > 0 ? setStep(step - 1) : nav(-1)}>Назад</button>
              <button className="btn btn-primary" style={{ padding: '12px 40px' }} onClick={() => step < STEPS.length - 1 ? setStep(step + 1) : nav('/exchange')}>
                {step === STEPS.length - 1 ? 'Опубликовать' : 'Дальше'}
              </button>
            </div>
          </div>
        </div>
      </section>
    </div>
  );
};
