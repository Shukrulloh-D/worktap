import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { REVIEWS } from 'shared/api/mocks';
import { ReviewCard } from 'entities/review';
import { StarIcon } from 'shared/ui/icon';
import { IMAGES } from 'shared/config/images';
import { useToast } from 'shared/lib/toast';
import styles from './work-detail.module.css';

const FAQ = [
  { q: 'Исходники будут?', a: 'Да, исходные файлы передаются вместе с работой.' },
  { q: 'А в каком формате я получу исходники?', a: 'Все популярные форматы: .fig, .psd, .ai, .png, .jpg' },
  { q: 'А что если мне не понравится дизайн?', a: 'Мы сможем доработать, пока вам не понравится.' },
];

export const WorkDetailPage = () => {
  const nav = useNavigate();
  const toast = useToast();
  const [tab, setTab] = useState('desc');
  const [openFaq, setOpenFaq] = useState(-1);

  return (
    <div className="pageFadeIn">
      <section className={styles.section}>
        <div className="container">
          <div className={styles.breadcrumbs}>Главная / Все категории / Ворки</div>
          <div className={styles.layout}>
            <div>
              <h1 className={styles.title}>Дизайн сайта</h1>
              <div className={styles.gallery}>
                {/* ЗАМЕНИ КАРТИНКИ ЧЕРЕЗ IMAGES.workImage1... */}
                <img src={IMAGES.workImage1} alt="" />
                <img src={IMAGES.workImage2} alt="" />
                <img src={IMAGES.workImage3} alt="" />
              </div>

              <div className={styles.tabs}>
                {[['desc','Описание'],['req','Требования к заказчику'],['rev','Отзывы (65)']].map(([k, l]) => (
                  <button key={k} className={`${styles.tab} ${tab === k ? styles.tabActive : ''}`} onClick={() => setTab(k)}>{l}</button>
                ))}
              </div>

              {tab === 'desc' && (
                <div>
                  <div className={styles.block}>
                    <h3>Об этом ворке</h3>
                    <p>Почему бы вам не отдохнуть этот ворк, чтобы изучить несколько способов, которые помогут вам заработать на жизнь и получать удовольствие от работы. KZT — не просто увлечение, это может быть большая работа. Наши эксперты дизайнеры готовы предложить вам дизайн-решения.</p>
                  </div>
                  <div className={styles.block}>
                    <h3>Часто задаваемые вопросы</h3>
                    {FAQ.map((f, i) => (
                      <div key={i} className={styles.faq}>
                        <div className={styles.faqTitle} onClick={() => setOpenFaq(openFaq === i ? -1 : i)}>
                          <span>{f.q}</span>
                          <span>{openFaq === i ? '−' : '+'}</span>
                        </div>
                        {openFaq === i && <div className={styles.faqText}>{f.a}</div>}
                      </div>
                    ))}
                  </div>
                  <div className={styles.block}>
                    <h3>Требования к заказчику</h3>
                    <ul>
                      <li>Предоставить Технические задание</li>
                      <li>Предоставить примеры дизайна</li>
                      <li>Указать целевую аудиторию</li>
                    </ul>
                  </div>
                  <div className={styles.block}>
                    <h3>Отзывы</h3>
                    <div className={styles.reviews}>
                      {REVIEWS.slice(0, 3).map(r => <ReviewCard key={r.id} review={r} />)}
                    </div>
                  </div>
                </div>
              )}
              {tab === 'req' && <p className={styles.block} style={{ color: 'var(--c-gray)' }}>Требования к заказчику будут указаны здесь.</p>}
              {tab === 'rev' && (
                <div className={styles.reviews}>
                  {REVIEWS.map(r => <ReviewCard key={r.id} review={r} />)}
                </div>
              )}
            </div>

            <aside className={styles.side}>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Эконом пакет</h3>
                <div className={styles.price}>50 000 тг</div>
                <div className={styles.meta}>Сделаю за 5 дней</div>
                <div className={styles.option}><span>Количество доработок 5</span></div>
                <div className={styles.option}><span>Переменная 1</span></div>
                <div className={styles.option}><span>Переменная 2</span></div>
                <button className={styles.packageBtn} onClick={() => { toast('Заказ оформлен!'); nav('/purchases'); }}>Добавить в заказ</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Стандарт пакет</h3>
                <div className={styles.option}><span>Количество доработок 5</span></div>
                <button className={`${styles.packageBtn} ${styles.packageBtnOutline}`} onClick={() => toast('Выбран стандарт')}>Выбрать</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Премиум пакет</h3>
                <div className={styles.option}><span>Количество доработок 10</span></div>
                <button className={`${styles.packageBtn} ${styles.packageBtnOutline}`} onClick={() => toast('Выбран премиум')}>Выбрать</button>
              </div>
              <div className={styles.card}>
                <h3 className={styles.cardTitle}>Исполнитель</h3>
                <div className={styles.author}>
                  <img src={IMAGES.curator} alt="" />
                  <div>
                    <div className={styles.authorName}>Екатерина Иванова</div>
                    <div className={styles.authorRole}>Заказов сделано: 25</div>
                  </div>
                </div>
                <div style={{ display: 'flex', gap: 2, marginBottom: 12 }}>
                  {[1,2,3,4,5].map(i => <StarIcon key={i} filled={i <= 4} size={14} />)}
                </div>
                <div className={styles.tags}>
                  {['Дизайн сайта','Веб дизайн','UX UI дизайн'].map(t => <span key={t} className={styles.tag}>{t}</span>)}
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
    </div>
  );
};
