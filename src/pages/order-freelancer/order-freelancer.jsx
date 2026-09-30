import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { IMAGES } from 'shared/config/images';
import { StarIcon } from 'shared/ui/icon';
import { useToast } from 'shared/lib/toast';
import styles from './order-freelancer.module.css';

export const OrderFreelancerPage = () => {
  const toast = useToast();
  const [form, setForm] = useState({ price: '', days: '', qty: '', desc: '' });

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.breadcrumbs}>Дизайн / Веб и мобильный дизайн / Веб-дизайн</div>
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Нужно сделать Дизайн сайта по тематике авто</h1>
              <div className={styles.meta}>
                <strong>50 000 тенге</strong>
                <span>до 14.07.2021</span>
              </div>
              <p className={styles.desc}>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt aliquet felis ullamcorper duis faucibus sapien tincidunt tristique elit. Facilisi feugiat neque morbi quis. Justo non mauris velit amet, habitasse. Enim, euismod purus semper urna.</p>

              <div className={styles.docs}>
                {['Документ 1.png','Документ 2.jpeg','Документ 3.pdf'].map(d => (
                  <div key={d} className={styles.doc}>📄 {d}</div>
                ))}
              </div>

              <button className={`btn btn-primary ${styles.submit}`} onClick={() => toast('Отклик отправлен!')}>Предложить услугу</button>
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Размещено проектов на бирже: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div className={styles.proposals}>15 отзывов</div>
              </div>

              <div className={styles.card}>
                <h3 style={{ fontSize: 16, fontWeight: 700, marginBottom: 16 }}>Предложить услугу</h3>
                <div className={styles.form}>
                  <div>
                    <label>Стоимость</label>
                    <input className="input" placeholder="Placeholder" value={form.price} onChange={(e) => setForm({ ...form, price: e.target.value })} />
                  </div>
                  <div>
                    <label>Сроки в днях</label>
                    <input className="input" placeholder="Placeholder" value={form.days} onChange={(e) => setForm({ ...form, days: e.target.value })} />
                  </div>
                  <div>
                    <label>Количество доработок</label>
                    <input className="input" placeholder="Placeholder" value={form.qty} onChange={(e) => setForm({ ...form, qty: e.target.value })} />
                  </div>
                  <div>
                    <label>Описание</label>
                    <textarea className="input" placeholder="Кратко опишите свой ворк" style={{ minHeight: 80 }} value={form.desc} onChange={(e) => setForm({ ...form, desc: e.target.value })} />
                  </div>
                  <button type="button" className="btn btn-primary" onClick={() => toast('Услуга предложена')}>Предложить услугу</button>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
